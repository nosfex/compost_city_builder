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
import flixel.FlxG;

/**
 * ...
 * @author Gerardo Heidel
 */
class GridMap extends FlxGroup
{

	private var _grids :Array<BaseGrid> = null;
	private var _initPos :FlxPoint = null;
	private var _posCorrection :FlxPoint = null;
	private var _walkers :Array<BaseGrid> = null;
	private var _lastGridCount :Int = 0;
	public function new() 
	{
		super();
		
	}
	
	  
	override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
	
	public function initMap(gridCount :Int) :Void
	{
		if (_grids == null)
		{
			_grids = new Array();
			
		}
		
		_lastGridCount = gridCount;
		var maxGrids: Float = Math.sqrt(gridCount);
		var col :Int = 0;
		var row :Int = 0;
		
		while(row < maxGrids)
		{
			var g :BaseGrid = new BaseGrid( 32 + ( (col ) * (96 * 1.25)),  32 + ( (row) * (96 * 1.25)) ) ;
			_grids.push(g);
			//g.visible = false;
			g.usable = false;
			
			col++;
			if (col >= maxGrids)
			{
				col = 0;
				row ++;
			}
			
			add(g);
		}
		_initPos = new FlxPoint(_grids[0].x, _grids[0].y);
		_walkers = new Array();
		
		scaleToGrowth();
	//	unlockAreas();
	}
	
	public function scaleToGrowth() :Void
	{
		var maxGrids :Float = Math.sqrt(_grids.length);
		var gridsTotalSize :Float = ( 96 * 1.25) * maxGrids;
		
		var maxHeightScale = FlxG.height * .85;
		
		var newScale :Float = maxHeightScale / gridsTotalSize;
		var reorder :Array<BaseGrid> = _grids;
		if (gridsTotalSize >= maxHeightScale)
		{
			
			
			for (i in 0 ... _grids.length )
			{
				var oldWidth :Float = (32 *  _grids[i].scale.x) + ((_grids[i].width * _grids[i].scale.x ) * 1.25);
				var newWidth :Float = (32 * newScale) + ((_grids[i].width * newScale ) * 1.25);
				
				_grids[i].x /= oldWidth;
				_grids[i].x *= newWidth;
				
				var oldHeight :Float = (32 * _grids[i].scale.y) + ((_grids[i].height * _grids[i].scale.y ) * 1.25);
				var newHeight :Float = (32 * newScale) + ((_grids[i].height * newScale ) * 1.25);
				_grids[i].y /= oldHeight;
				_grids[i].y *= newHeight;
				
				var xIndex :Int = cast(Math.round(_grids[i].x / newWidth));
				var yIndex :Int = cast(Math.round(_grids[i].y / newHeight) * maxGrids);
				// GH: Correct position
				
				
				(cast(_grids[i])).origin = new FlxPoint();
			}
		
			this.setAll("scale", new FlxPoint(newScale, newScale), true);		
		}
	}
	
	
	private function unlockAreas() :Void
	{
		// GH: Check out the size and then pick the amount of clusters
		var maxGrids :Int = cast(Math.sqrt(_grids.length));
	
		var visCount :Int = getGridsByUsable(true).length;
		
		// GH: Generate a central cluster
		if (visCount == 0)
		{
			trace(visCount);
			var col :Int = cast(Math.floor(maxGrids/2 -1));
			var row :Int = col;
		//	addN4Cluster(col, row);
			addN4Cluster(3, 3);
		}
		
		else
		{
			activateGridNearActivatedGrid();
		}
	
	}
	
	public function getGridsByUsable( usable :Bool ) : Array<BaseGrid>
	{
		var ret :Array<BaseGrid> = new Array();
		
		for (i in 0 ... _grids.length)
		{
			if (_grids[i].usable == usable)
			{
				ret.push(_grids[i]);
			}
		}
		
		return ret;
	}
	
	
	private function activateGridNearActivatedGrid() :Void
	{
		var arr :Array <BaseGrid> = getGridsByUsable(true);
		trace("How many active: " + arr.length);
		trace(arr);
		var maxSide :Int = cast(Math.sqrt(_grids.length) - 1 );
		if (arr.length % 3 != 0)
		{
			arr.reverse();
		}
		
		
		for (i in 0 ... arr.length)
		{
			var col :Int =  cast(Math.round(arr[i].x / _grids[0].x ) / 3 );
			var row :Int =  cast(Math.round(arr[i].y / _grids[0].y ) /3);
			
			//trace("COL: " + col + " ROW: " + row);
			var n4arr :Array<BaseGrid> = N4FromColRow(col, row);
			//trace("ARRDATA: " + n4arr);
			if (n4arr.length == 0)
			{
				trace("Fucking up the col / rows perhaps");
				//continue;
			}
		//	n4arr.reverse();
			for (j in 0 ... n4arr.length)
			{
				n4arr.reverse();
				if (n4arr[j].usable == false)
				{
					
					n4arr[j].usable = true;
					return;
				}
				
			}
		}
	}
	
	private function activateByWalk() :Void
	{
		
		// GH: Pick a random grid from the activated ones
		var randomIndex :Int = cast(Math.floor(Math.random() * getGridsByUsable(false).length));
		var pickGrid :BaseGrid = getGridsByUsable(false)[randomIndex];
	
		var n4 :Array<BaseGrid> = N4FromGrid(pickGrid);
		var pickPool :Array<BaseGrid> = new Array();
	
		for (i in 0 ... n4.length)
		{
			if (n4[i].usable == false )
			{
				pickPool.push(n4[i]);
			}
		}
		
		randomIndex = cast(Math.floor(Math.random() * pickPool.length ));
		//pickPool[randomIndex].usable = true;
		_walkers.push(pickPool[randomIndex]);
	}
	
	private function activateRandom() :Void
	{
		var randomIndex :Int = cast(Math.floor(Math.random() * getGridsByUsable(false).length));
		var pickGrid :BaseGrid = getGridsByUsable(false)[randomIndex];
		pickGrid.usable = true;
	}
	
	private function processWalkers() :Void
	{
		for (walker in _walkers)
		{
			
			if (walker == null)
				continue;
			var n4 :Array<BaseGrid> = N4FromGrid(walker);
				
			if (n4.length == 0)
				continue;
			
			for (culling in n4)
			{
				if (culling.usable)
				{
					n4.remove(culling);
					continue;
				}
				
			}
			var randomIndex : Int = cast(Math.floor(Math.random() * n4.length ));
			
			if (randomIndex == 0)
				break;
			var nextWalker : BaseGrid = n4[randomIndex];
			walker.usable = true;
		//	_walkers.remove(walker);
			_walkers.push(nextWalker);
		}
		}
	
	
	private function addN4Cluster(col :Int, row : Int) :Void
	{
		var arr :Array<BaseGrid> = N4FromColRow(col, row);
		for (i in 0 ... arr.length)
		{
			if (arr[i].usable == false)
			{
				arr[i].usable = true;
			}
		}
	}
	
	
	public function N4FromGrid(baseGrid :BaseGrid) :Array<BaseGrid>
	{	
		var col :Int = cast(Math.round(baseGrid.x / _grids[0].x ) / 3);
		var row :Int = cast(Math.round(baseGrid.y / _grids[0].y ) / 3);
		
		return N4FromColRow(col, row);	
	}
	
	public function gridFromColRow(col :Int , row: Int) :BaseGrid
	{
		var posX : Float = Math.round((32 * _grids[0].scale.x) + (col * ((_grids[0].width * _grids[0].scale.x ) * 1.25) ));
		var posY : Float = Math.round((32 * _grids[0].scale.y) + (row * ((_grids[0].height * _grids[0].scale.y ) * 1.25) ));
		
		for (i in 0 ... _grids.length)
		{	
			
			//trace("GRIDX:" + Math.round(_grids[i].x) + " POSX: " + posX +  " GRIDY: " + Math.round(_grids[i].y) + " POSY: " + posY);
			
			if (Math.round(_grids[i].x) == posX && Math.round(_grids[i].y) == posY)
			{
			//	trace("POSX: " + posX + " POSY: " + posY);
			//	trace("FOUND A GRID: " + col + " / " + row);
				return (_grids[i]);
			}
		}
		
		return null;
	}
	
	public function N4FromColRow(col :Int, row :Int) :Array<BaseGrid>
	{
		var ret :Array<BaseGrid> = new Array();
		
		var top :BaseGrid = gridFromColRow(col, row -1);
		var bot :BaseGrid = gridFromColRow(col, row +1);
		var center :BaseGrid = gridFromColRow(col, row);
		var left :BaseGrid = gridFromColRow(col -1 , row);
		var right :BaseGrid = gridFromColRow(col + 1, row);
		
		if (top != null) ret.push(top);
		if (bot != null) ret.push(bot);
		if (center != null) ret.push(center);
		if (left != null) ret.push(left);
		if (right != null) ret.push(right);
	
		return ret;
	}

	public function addGrids(colrowToAdd :Float) :Void
	{
		var initGrids :Float = Math.sqrt(_grids.length);
		var maxRow :Float = 0;
		var maxCol :Float = initGrids;
		
		var maxGridsToAdd: Float = initGrids + colrowToAdd;
		
		while (maxRow < maxGridsToAdd)
		{
			var g :BaseGrid = new BaseGrid( 32 + ( (maxCol ) * (96 * 1.25)),   32 + ( (maxRow) * (96 * 1.25)) ) ;
			//_grids.push(g);
			_grids.unshift(g);
			g.alpha = 0.5;
			maxCol++;
			if (maxCol >= maxGridsToAdd)
			{
				
				maxCol = initGrids;
				maxRow ++;
				if (maxRow == maxGridsToAdd - 1)
				{
					maxCol = 0;
				}
			}
			
			add(g);
		}
		
		_grids.sort(sortGrids);
		
		scaleToGrowth();
		
		trace("*-------------------TURN DOWN FOR WHAT-------------*");
		for(g in _grids)
			trace(g);
			
	/*	for(i in 0 ... 2)
			activateByWalk();
			
		for (i in 0 ... 3)
			processWalkers();
			
		for (i in 0 ... 4)
			activateRandom();
		unlockAreas();-*/
	}
	
	
	function sortGrids(a :BaseGrid, b : BaseGrid) :Int
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