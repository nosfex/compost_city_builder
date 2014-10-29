package grid;

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

class GridMap extends FlxGroup
{
    var _grids:Array<BaseGrid> = null;

    var _initPos:FlxPoint = null;

    var _posCorrection:FlxPoint = null;

    var _lastGridCount:Int = 0;

    var _powered:Array<BaseGrid> = new Array();

    public function new()
    {
    	super();
    }

    override public function update():Void
    {
    	super.update();
	
		checkPowered();
	
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
    			if (b.isPowered()) 
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

    override public function destroy():Void
    {
    	super.destroy();
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

    function addN4Cluster(col:Int, row:Int):Void
    {
    	var arr:Array<BaseGrid> = N4FromColRow(col, row);
    	for (i in 0 ... arr.length) {
    		if (arr[i].usable == false) {
    			arr[i].usable = true;
    		};
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
    	trace("---------*N4FROMINDEX*---------");
    	trace("SIDESIZE: " + sideSize);
    	trace("left: " + left);
    	trace("right: " + right);
    	return ret;
    }

    public function N4FromGrid(baseGrid:BaseGrid):Array<BaseGrid>
    {
    	var col:Int = cast Math.round(baseGrid.x / _grids[0].x);
    	var row:Int = cast Math.round(baseGrid.y / _grids[0].y);
    	return N4FromColRow(col, row);
    }

    public function gridFromColRow(col:Int, row:Int):BaseGrid
    {
    	var posX:Float = Math.round((32 * _grids[0].scale.x) + (col * ((_grids[0].width * _grids[0].scale.x) * 1.25)));
    	var posY:Float = Math.round((32 * _grids[0].scale.y) + (row * ((_grids[0].height * _grids[0].scale.y) * 1.25)));
    	for (i in 0 ... _grids.length) {
    		if (Math.round(_grids[i].x) == posX && Math.round(_grids[i].y) == posY) {
    			return (_grids[i]);
    		};
    	};
    	return null;
    }

    public function N4FromColRow(col:Int, row:Int):Array<BaseGrid>
    {
    	var ret:Array<BaseGrid> = new Array();
    	var top:BaseGrid = gridFromColRow(col, row - 1);
    	var bot:BaseGrid = gridFromColRow(col, row + 1);
    	var center:BaseGrid = gridFromColRow(col, row);
    	var left:BaseGrid = gridFromColRow(col - 1, row);
    	var right:BaseGrid = gridFromColRow(col + 1, row);
    	if (top != null) ret.push(top);
    	if (bot != null) ret.push(bot);
    	if (center != null) ret.push(center);
    	if (left != null) ret.push(left);
    	if (right != null) ret.push(right);
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
