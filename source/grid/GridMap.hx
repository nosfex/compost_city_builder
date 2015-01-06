package grid;
import flixel.util.FlxRect;

import flash.geom.Point;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.scaleModes.BaseScaleMode;
import haxe.ds.Vector.Vector;
import flixel.util.FlxPoint;
import flixel.util.FlxSort;
import buildings.Building;
import flixel.FlxG;
import production.Product;
class GridMap extends FlxGroup
{
    var _grids:Array<BaseGrid> = null;
    var _initPos:FlxPoint = null;
    var _posCorrection:FlxPoint = null;
    var _lastGridCount:Int = 0;
	
	var _products :Array<Product> = new Array<Product>();
	
	public function new()
    {
    	super();
		CompostG.GRID_MAP = this;
    }

    override public function update():Void
    {
    	super.update();
		
		for (i in 0 ... _grids.length)
		{
			if (_grids[i].forceCheck)
			{
				unpowerEverything();
				_grids[i].forceCheck = false;
			}
		}
		checkPowered();	
		clearDead();
    }
	
	function unpowerEverything()
	{
		for (i in 0 ... _grids.length)
		{
    		_grids[i].setPowered(false);
    	}
	}

    function checkPowered():Void
    {
    	_grids.sort(sortGrids);
    	
    	for (i in 0 ... _grids.length) 
		{
    		var b:Building = _grids[i].getBuilding();
    		if (b != null) 
			{
    			if (b.powered) 
				{
    				if (b.getProductionType() == "power" && b.getProduction() > 0) 
					{
    					_grids[i].setPowered(true);
    					
    					if (b.getInfluenceArea() == "N4") 
						{
    						var n4arr:Array<grid.BaseGrid> = N4FromIndex(i);
    						for (j in 0 ... n4arr.length) 
							{
    							n4arr[j].setPowered(true);
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
			var parent : Building = _products[i].prodParent;
			if ( parent.getProductionType() == prodType )
			{
				if (parent.productionObject.length >= amount)
				{
					if (amountToTake <= 0)
					{
						trace("exit using prod: " + prodType);
						return;
					}
					trace("Can we get them?");
					for (j in 0 ... amount)
					{
						parent.productionObject[j].use(from);
						parent.productionObject.splice(j, 1);
						trace("parent.productionObject: " + parent.productionObject.toString());
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
	}
	
	function checkProducts() :Void
	{
		for (i in 0 ... _products.length)
		{
			for(j in 0 ... _grids.length)
			{
				
				FlxG.collide(_products[i], _grids[j]);
			}
		}
	}

    override public function destroy():Void
    {
    	super.destroy();
		_grids = null;
    }

    public function initMap(gridCount:Int):Void
    {
    	if (_grids == null) {
    		_grids = new Array();
    	};
    	_lastGridCount = gridCount;
    	var maxGrids:Float = Math.sqrt(gridCount);
    	var col:Int = 0;
    	var row:Int = 0;
    	while (row < maxGrids) {
    		var g:BaseGrid = new BaseGrid(32 + ((col) * (96 * 1.25)), 32 + ((row) * (96 * 1.25)));
    		_grids.push(g);
    		g.usable = false;
    		col++;
    		if (col >= maxGrids) {
    			col = 0;
    			row++;
    		};
    		add(g);
    	};
    	_initPos = new FlxPoint(_grids[0].x, _grids[0].y);
    	scaleToGrowth();
    }

    public function scaleToGrowth():Void
    {
    	var maxGrids:Float = Math.sqrt(_grids.length);
    	var gridsTotalSize:Float = (96 * 1.25) * maxGrids;
    	var maxHeightScale = FlxG.height * .85;
    	var newScale:Float = maxHeightScale / gridsTotalSize;
    	var reorder:Array<BaseGrid> = _grids;
    	if (gridsTotalSize >= maxHeightScale) {
    		for (i in 0 ... _grids.length) {
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
    		};
    		this.setAll("scale", new FlxPoint(newScale, newScale), true);
		
    	};
    }

    public function N4FromIndex(index:Int):Array<BaseGrid>
    {
    	var sideSize:Float = Math.sqrt(_grids.length);
    	var top:Int = cast index - sideSize;
    	var left:Int = cast index - 1;
    	var right:Int = cast index + 1;
    	var bottom:Int = cast index + sideSize;
    	var ret:Array<BaseGrid> = new Array();
    	if (top >= 0) {
    		ret.push(_grids[top]);
    	};
    	if (bottom < _grids.length) {
    		ret.push(_grids[bottom]);
    	};
    	if (index % sideSize != 0) {
    		ret.push(_grids[left]);
    	};
    	if (right % sideSize != 0 && right < _grids.length) {
    		ret.push(_grids[right]);
    	};
    
    	return ret;
    }

    public function addGrids(colrowToAdd:Float):Void
    {
    	var initGrids:Float = Math.sqrt(_grids.length);
    	var maxRow:Float = 0;
    	var maxCol:Float = initGrids;
    	var maxGridsToAdd:Float = initGrids + colrowToAdd;
    	while (maxRow < maxGridsToAdd) {
    		var g:BaseGrid = new BaseGrid(32 + ((maxCol) * (96 * 1.25)), 32 + ((maxRow) * (96 * 1.25)));
    		_grids.unshift(g);
    		g.alpha = 0.5;
    		maxCol++;
    		if (maxCol >= maxGridsToAdd) {
    			maxCol = initGrids;
    			maxRow++;
    			if (maxRow == maxGridsToAdd - 1) {
    				maxCol = 0;
    			};
    		};
    		add(g);
    	};
    	_grids.sort(sortGrids);
    	scaleToGrowth();
		
		checkPowered();
    }

    function sortGrids(a:BaseGrid, b:BaseGrid):Int
    {
    	if (a.y < b.y) {
    		return -1;
    	};
    	if (a.x < b.x && a.y == b.y) {
    		return -1;
    	};
    	return 1;
    }
}
