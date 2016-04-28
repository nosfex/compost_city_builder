package grid;
import buildings.BuildingFactory;
import flixel.system.scaleModes.BaseScaleMode;
import flixel.math.FlxRect;
import flixel.group.FlxSpriteGroup;
import flash.geom.Point;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import haxe.ds.Vector.Vector;
import flixel.math.FlxPoint;

import buildings.Building;
import flixel.FlxG;
import production.Product;
import world.World;
import sys.io.File;
import haxe.Json;

class GridMap extends FlxSpriteGroup
{
    var _grids:Array<Array<BaseGrid>> = null;
    var _initPos:FlxPoint = null;
    var _posCorrection:FlxPoint = null;
    var _lastGridCount:Int = 0;
	var _increaseGridCount = 0;
	var _products :Array<Product> = new Array<Product>();
	var tileSizeOffset :Int = 96;
	var quarterTileSize :Int = 32;
	
	var _gridData : Array<GridData> = new Array<GridData>();
	
	@:isVar public var world(default, default) : World = null;
	
	public function new(X:Float = 0, Y:Float = 0, MaxSize:Int = 0)
    {
    	super(X, Y, MaxSize);
		CompostG.GRID_MAP = this;
    }

	// GH: main loop of the grid
    override public function update(elapsed :Float):Void
    {
    	super.update(elapsed);
		
		// GH: turn off everything if something changed in a grid
		for (i in 0 ... _grids.length)
		{
			for ( j in 0 ... _grids[i].length)
			{
				if (_grids[i][j].forceCheck)
				{
					unpowerEverything();
					_grids[i][j].forceCheck = false;
				}
			}
		}
		// GH: Always try to see if we have to power up anything
		checkPowered();	
		clearDead();
		
		// GH: Check pick
		if (FlxG.mouse.justPressed)
		{
			FlxG.log.add("PRE SELECTED");
			for (i in 0 ... _grids.length)
			{
				for ( j in 0 ... _grids[i].length)
				{
					if(CompostG.UI_SELECTOR.selectedGrid != _grids[i][j])
					{
						_grids[i][j].selected = false;
					}
				}
			}
			FlxG.log.add("GOT GRID?");
			// GH: World coordinates, basic,
			// need to check functionality further
			CompostG.UI_SELECTOR.checkClearSelection();
			var mp : FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
			var g :BaseGrid = checkGridPos(mp);
			if (g == null)
			{
				// GH: Found nothing, clear up selection
				FlxG.log.add("No grid selected");
				
			}
			else
			{
				// GH: Lit up grid? 
				// GH: Grid selected effectively, pop up stuff
				if (CompostG.UI_SELECTOR.checkPassthrough())
				{
					FlxG.log.add("picking grid, good job");
					CompostG.UI_SELECTOR.setSelected(g);
					CompostG.CAM.moveToPos(new FlxPoint(g.x, g.y));
				}
			}
		}
    }
	
	function checkGridPos(point :FlxPoint) : BaseGrid
	{
		for (i in 0 ... _grids.length)
		{
			for (j in 0 ... _grids[i].length)
			{
				var g :BaseGrid = _grids[i][j];
				var rg : FlxRect = new FlxRect(g.x, g.y, g.width, g.height);
				if (rg.containsPoint(point))
				{
					return g;
				}
			}
		}
		
		return null;
	}
	
	
	// GH: Kill the lights
	function unpowerEverything()
	{
		for (i in 0 ... _grids.length)
		{
			for ( j in 0 ... _grids[i].length)
			{
				_grids[i][j].setPowered(false);
			}
    	}	
	}

	// GH: Turn on the lights
    function checkPowered():Void
    {
    	for (i in 0 ... _grids.length) 
		{
			for ( j in 0 ... _grids[i].length)
			{
				var b:Building = _grids[i][j].getBuilding();
				if (b != null) 
				{
					// GH: This building is powered?
					if (b.powered) 
					{
						// GH: If this building produces power and it has stock, move on
						if (b.getProductionType() == "power" && b.getProduction() > 0) 
						{
							// GH: Power this grid and it's neighbors
							_grids[i][j].setPowered(true);
							
							// GH: For now, power in an N4
							if (b.getInfluenceArea() == "N4") 
							{
								var n4arr:Array<grid.BaseGrid> = N4FromColRow(j, i);
								for (k in 0 ... n4arr.length) 
								{
									n4arr[k].setPowered(true);
								}
							}
						}
					}
				}
				
			}
    	}
    }
	
	// GH: Do we have garbage on the gridmap?
	function clearDead() :Void
	{
		for (i in 0 ... this.members.length)
		{
			if (!members[i].alive)
			{
				remove(members[i], true);
				break;
			}
		
		}
	}
	// GH: add production to the internal book keeping of the grid
	public function addProduct(product :Product) :Void
	{
		// GH: Add codE?!@?
		add(product);
		_products.push(product);
		product.flxColRect = new FlxRect(0, 0, FlxG.width * .75, FlxG.height * .85);
	}
	
	// GH: Consume a product
	public function removeProduct(prodType :String, amount :Int) :Array<Product>
	{
		var ret :Array<Product> = new Array<Product>();
		for (i in 0 ... _products.length)
		{
			var parent : Building = _products[i].prodParent;
			// GH: k, do we even have what we are asking for?
			if ( parent.getProductionType() == prodType )
			{
				// GH: We have it, do we have enough?
				if (parent.productionObject.length >= amount)
				{
					trace("Can we get them?");
					for (j in 0 ... amount)
					{
						// GH: Remove and ship it to consumer
						var p : Product = parent.productionObject.pop();
						ret.push(p);
						CompostG.updateProductAmount(prodType, -1);
					}
					return ret;
				}
			}
		}
		return ret;
	}
	
	public function useProduct(prodType :String, amount :Int, from :Building) :Void
	{
		var amountToTake :Int = amount;
		for (i in 0 ... _products.length)
		{	 
			if ( _products[i].productType == prodType )
			{
				if (_products.length >= amount)
				{
					trace("Can we get them?");
					_products[i].use(from);
					_products.splice(i, 1);
					amountToTake--;
					if (amountToTake <= 0)
					{
						trace("exit using prod: " + prodType);
						return;
					}
				}
			}
		}
	}
	// GH: I don't even
	function checkProducts() :Void
	{
	}

    override public function destroy():Void
    {
    	super.destroy();
		_grids = null;
    }

	// GH: Map creation
    public function initMap(gridCount:Int):Void
    {
		var fileContent = File.getContent(AssetPaths.grid_data__json);
		var jsonGrid :Dynamic = Json.parse(fileContent);
		
		for (i in 0 ... jsonGrid.grids.length)
		{
			var g : GridData = new GridData();
			switch(jsonGrid.grids[i].type)
			{
				case "water":
					g.type = BaseGrid.WATER_GRID;
				case "base":
					g.type = BaseGrid.NORMAL_GRID;
				case "mineral":
					g.type = BaseGrid.MINERAL_GRID;
			}
			g.powerable = jsonGrid.grids[i].power;
			g.filter = jsonGrid.grids[i].filter;
			_gridData.push(g);
		}
		
    	if (_grids == null) 
		{
    		_grids = new Array();
    	}
    	_lastGridCount = gridCount;
    	var maxGrids:Float = Math.sqrt(gridCount);
    	var col:Int = cast maxGrids;
    	var row:Int = cast maxGrids;
		
		for ( i in 0 ... col)
		{
			_grids.push(new Array());
		}
		
		for ( i in 0 ... row )
		{
			for ( j in 0 ... col)
			{
				// GH: Complex offsetting of the grids
				var g:BaseGrid = new BaseGrid(quarterTileSize + ((j) * (tileSizeOffset * 1.25)), quarterTileSize + ((i) * (tileSizeOffset * 1.25)));
    			g.usable = false;
				_grids[i].push(g);
				add(g);
			}
		}
		
		var halfGrid : Int = Math.floor(Math.sqrt(gridCount) / 2);
		BuildingFactory.CURRENT_BUILDING = "Headquarters";
		var middleGrid :BaseGrid = _grids[halfGrid][halfGrid];
		middleGrid.addBuilding(BuildingFactory.instance().createBuildingInstance());
		BuildingFactory.CURRENT_BUILDING = "";
		_initPos = new FlxPoint(middleGrid.x, middleGrid.y);
		
		setTileData();
	}

	// GH: Somehow keeping this
    public function scaleToGrowth():Void
    {
    /*	var maxGrids:Float = Math.sqrt(_grids.length);
    	var gridsTotalSize:Float = (96 * 1.25) * maxGrids;
    	var maxHeightScale = FlxG.height * .85;
    	var newScale:Float = maxHeightScale / gridsTotalSize;
    	var reorder:Array<BaseGrid> = _grids;
    	if (gridsTotalSize >= maxHeightScale) 
		{
    		for (i in 0 ... _grids.length)
			{
    			var oldWidth:Float = (32 * _grids[i].scale.x) + ((_grids[i].width * _grids[i].scale.x) * 1.25);
    			var newWidth:Float = (32 * newScale) + ((_grids[i].width * newScale) * 1.25);
    			_grids[i].x /= oldWidth;
    			_grids[i].x *= newWidth;
    			var oldHeight:Float = (32 * _grids[i].scale.y) + ((_grids[i].height * _grids[i].scale.y) * 1.25);
    			var newHeight:Float = (32 * newScale) + ((_grids[i].height * newScale) * 1.25);
    			_grids[i].y /= oldHeight;
    			_grids[i].y *= newHeight;
    			var xIndex:Int = cast Math.round(_grids[i].x / newWidth);
    			var yIndex:Int = cast Math.round(_grids[i].y / newHeight) * maxGrids;
    			(cast _grids[i]).origin = new FlxPoint();
    		}
    		this.setAll("scale", new FlxPoint(newScale, newScale), true);
		
    	}*/
    }

    public function N4FromColRow(col:Int, row: Int):Array<BaseGrid>
    {
    	var sideSize:Float = Math.sqrt(_grids.length);
    	var top:Int = cast row - 1;
    	var left:Int = cast col - 1;
    	var right:Int = cast col + 1;
    	var bottom:Int = cast row + 1;
    	var ret:Array<BaseGrid> = new Array();
    	if (top >= 0)
		{
    		ret.push(_grids[top][col]);
    	}
    	if (bottom < _grids[0].length) 
		{
    		ret.push(_grids[bottom][col]);
    	}
    	if (left >= 0) 
		{
    		ret.push(_grids[row][left]);
    	}
    	if (right < _grids[0].length) 
		{
    		ret.push(_grids[row][right]);
    	}
    
    	return ret;
    }

    public function addGrids():Void
    {
		_increaseGridCount++;
		_increaseGridCount++;
		var maxRow :Int = _grids[0].length  + 2;
		var maxCol :Int = maxRow;
		
		// GH: Create new grid
		var temp : Array<Array<BaseGrid>> = new Array();
		
		for (i in 0 ... maxRow)
		{
			temp[i] = new Array();
		}
		// GH: create a new map and fill it with rubbish
		for (i in 0 ... maxRow)
		{
			for (j in 0 ... maxCol)
			{
				var g:BaseGrid = new BaseGrid(quarterTileSize + ((j-_increaseGridCount) * (tileSizeOffset * 1.25)), quarterTileSize+ ((i-_increaseGridCount) * (tileSizeOffset * 1.25)));
    			g.usable = false;
				temp[i].push(g);
			}
		}
			
		
		// GH: Copy the old shit
		for(i in 1 ... maxRow - 1)
		{
			for (j in 1 ... maxCol - 1)
			{
				var newPos : FlxPoint = new FlxPoint(temp[i][j].x, temp[i][j].y);
				// GH: Temp now has the old data
				temp[i][j] = _grids[i-1][j-1];
				temp[i][j].x =newPos.x; temp[i][j].y = newPos.y;
			}

		}
			
		for (j in 0 ... maxCol)
		{
			add(temp[0][j])	;
			add(temp[maxRow -1][j]);
		}
		
		for (j in 1 ... maxRow - 1)
		{
			add(temp[j][0])	;
			add(temp[j][maxCol - 1]);
		}
			
		_grids = temp;
		// GH: Camera bounds resetting
		var boundHeight: Float = FlxG.height * .25 +  _grids[maxRow - 1][maxCol - 1].y + -( _grids[0][0].y - quarterTileSize);
		var boundWidth: Float =  FlxG.width * .75 +  _grids[maxRow - 1][maxCol - 1].x + -(_grids[0][0].x - quarterTileSize);
		
		// GH: Add extra room to give the camera a little breather
		boundHeight += tileSizeOffset * 2;
		
		var rect :FlxRect = new FlxRect(-tileSizeOffset + _grids[0][0].x - quarterTileSize, -tileSizeOffset +  _grids[0][0].y - quarterTileSize, -tileSizeOffset + boundWidth, boundHeight );
		FlxG.log.add("BOUNDWIDTH: "+ boundWidth);
		FlxG.log.add("BOUNDHEIGHT: "+ boundHeight);
		FlxG.log.add("BOUNDX: " + rect.x);
		FlxG.log.add("BOUNDY: " + rect.y);
		FlxG.camera.setScrollBoundsRect( rect.x, rect.y, boundWidth, boundHeight);
		
		_lastGridCount = _grids[0].length * _grids[0].length;
		setTileData();
		var halfPos :Int = cast Math.floor(_grids.length / 2);
		CompostG.CAM.moveToPos(new FlxPoint(_grids[halfPos][halfPos].x, _grids[halfPos][halfPos].y ));
    }
	
	
	// GH: Set tile data (loaded from World class)
	public function setTileData() :Void
	{
		var ids: Array<Array<Int>> = world.getIDMapForSize(_grids.length);
		for (i in 0 ... _grids.length)
		{
			for (j in 0 ... _grids.length)
			{
				var ij : Int = ids[i][j] ;
				_grids[i][j].type = ij;
				
				for (xx in 0 ... _gridData.length )
				{
					if (_gridData[xx].type == ij)
					{
						_grids[i][j].filter = _gridData[xx].filter;
						_grids[i][j].powerable = _gridData[xx].powerable;
					}
				}
			}
		}
	}
	
	// GH: lock cam to the center
	public function focusOnCenterGrid() : Void
	{
		var halfGrid : Int = Math.floor(Math.sqrt(_lastGridCount) / 2);
		var middleGrid :BaseGrid = _grids[halfGrid][halfGrid];
		_initPos = new FlxPoint(middleGrid.x, middleGrid.y);
		FlxG.log.add(" FOKKIN INITPOS: " + _initPos.toString() + " HALF GRID: " + halfGrid + " _lastGridCount: "+ _lastGridCount );
		CompostG.CAM.moveToPos(_initPos);
	}

	// GH: Sort from 0.0 to max.max
    function sortGrids(a:BaseGrid, b:BaseGrid):Int
    {
    	if (a.y < b.y)
		{
    		return -1;
    	}
    	if (a.x < b.x && a.y == b.y) 
		{
    		return -1;
    	}
    	return 1;
    }
}
