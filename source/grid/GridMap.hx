package grid;
import flixel.util.FlxRect;
import flixel.group.FlxSpriteGroup;
import flash.geom.Point;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import haxe.ds.Vector.Vector;
import flixel.util.FlxPoint;
import flixel.util.FlxSort;
import buildings.Building;
import flixel.FlxG;
import production.Product;
class GridMap extends FlxSpriteGroup
{
    var _grids:Array<Array<BaseGrid>> = null;
    var _initPos:FlxPoint = null;
    var _posCorrection:FlxPoint = null;
    var _lastGridCount:Int = 0;
	var _increaseGridCount = 0;
	var _products :Array<Product> = new Array<Product>();
	
	public function new(X:Float = 0, Y:Float = 0, MaxSize:Int = 0)
    {
    	super(X, Y, MaxSize);
		CompostG.GRID_MAP = this;
    }

    override public function update():Void
    {
    	super.update();
		
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
		checkPowered();	
		clearDead();
    }
	
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

    function checkPowered():Void
    {
    //	_grids.sort(sortGrids);
    	
    	for (i in 0 ... _grids.length) 
		{
			for ( j in 0 ... _grids[i].length)
			{
				var b:Building = _grids[i][j].getBuilding();
				if (b != null) 
				{
					if (b.powered) 
					{
						if (b.getProductionType() == "power" && b.getProduction() > 0) 
						{
							_grids[i][j].setPowered(true);
							
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
	
	public function addProduct(product :Product) :Void
	{
		// GH: Add codE?!@?
		add(product);
		_products.push(product);
		product.flxColRect = new FlxRect(0, 0, FlxG.width * .75, FlxG.height * .85);
	}
	
	public function removeProduct(prodType :String, amount :Int) :Array<Product>
	{
		var ret :Array<Product> = new Array<Product>();
		for (i in 0 ... _products.length)
		{
			var parent : Building = _products[i].prodParent;
			if ( parent.getProductionType() == prodType )
			{
				if (parent.productionObject.length >= amount)
				{
					trace("Can we get them?");
					for (j in 0 ... amount)
					{
						var p : Product = parent.productionObject.pop();
						ret.push(p);
						CompostG.updateProductAmount(prodType, -1);
						trace("Count: " + j);
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
	
	function checkProducts() :Void
	{
	}

    override public function destroy():Void
    {
    	super.destroy();
		_grids = null;
    }

    public function initMap(gridCount:Int):Void
    {
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
				var g:BaseGrid = new BaseGrid(32 + ((j) * (96 * 1.25)), 32 + ((i) * (96 * 1.25)));
    			g.usable = false;
				_grids[i].push(g);
				add(g);
			}
		}
	
    	_initPos = new FlxPoint(_grids[0][0].x, _grids[0][0].y);
    //	scaleToGrowth();
    }

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
		var maxRow :Int = _grids[0].length  + 2;
		var maxCol :Int = maxRow;
		// GH: Create new grid
		var temp : Array<Array<BaseGrid>> = new Array();
		
		for (i in 0 ... maxRow)
		{
			temp[i] = new Array();
		}
		
		for (i in 0 ... maxRow)
		{
			for (j in 0 ... maxCol)
			{
				
				var g:BaseGrid = new BaseGrid(32 + ((j-_increaseGridCount) * (96 * 1.25)), 32 + ((i-_increaseGridCount) * (96 * 1.25)));
    			g.usable = false;
				temp[i].push(g);
				//add(g);
			}
		}
			
		
		// GH: Copy the old shit
		for(i in 1 ... maxRow - 1)
		{
			for (j in 1 ... maxCol - 1)
			{
				var newPos : FlxPoint = new FlxPoint(temp[i][j].x, temp[i][j].y);
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
		

		FlxG.camera.setBounds(_grids[0][0].x - 96*.25 , _grids[0][0].y - 96 *.25, FlxG.width * .75 + _grids[maxRow - 1][maxCol - 1].x + 96 * 3.25, FlxG.height * .25 +  _grids[maxRow - 1][maxCol - 1].y + 96 * 3.25);
    }

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
