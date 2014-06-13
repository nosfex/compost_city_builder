package grid;

import flash.geom.Point;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import haxe.ds.Vector.Vector;
import flixel.util.FlxPoint;

import flixel.FlxG;

/**
 * ...
 * @author Gerardo Heidel
 */
class GridMap extends FlxGroup
{

	private var _grids :Array<BaseGrid>= null;
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
		
		
		var maxGrids: Float = Math.sqrt(gridCount);
		var col :Int = 0;
		var row :Int = 0;
		
		while(row < maxGrids)
		{
			var g :BaseGrid = new BaseGrid( ( (col ) * (96 * 1.25)),  ( (row) * (96 * 1.25)) ) ;
			_grids.push(g);
			
			col++;
			if (col >= maxGrids)
			{
				col = 0;
				row ++;
			}
			
			add(g);
		}
		
		scaleToGrowth();
	}
	
	public function scaleToGrowth() :Void
	{
		var maxGrids :Float = Math.sqrt(_grids.length);
		var gridsTotalSize :Float =  (96 * 1.25) * maxGrids;
		
		var maxHeightScale = FlxG.height * .75;
		trace(_grids.length);
		var newScale :Float = maxHeightScale / gridsTotalSize;
		if (gridsTotalSize >= maxHeightScale)
		{
			
			
			for (i in 0 ... _grids.length )
			{
				var oldWidth :Float = (_grids[i].width * _grids[i].scale.x ) * 1.25;
				var newWidth :Float = (_grids[i].width * newScale ) * 1.25;
				_grids[i].x /= oldWidth;
				_grids[i].x *= newWidth;
				
				var oldHeight :Float = (_grids[i].height * _grids[i].scale.y ) * 1.25;
				var newHeight :Float = (_grids[i].height * newScale ) * 1.25;
				_grids[i].y /= oldHeight;
				_grids[i].y *= newHeight;
			}
			this.setAll("scale", new FlxPoint(newScale, newScale), true);
		}
	}
	
	public function addGrids(colrowToAdd :Float) :Void
	{
		var initGrids :Float = Math.sqrt(_grids.length);
		var maxRow :Float = 0;
		var maxCol :Float = initGrids;
		
		var maxGridsToAdd: Float = initGrids + colrowToAdd;
		
		while (maxRow < maxGridsToAdd)
		{
			var g :BaseGrid = new BaseGrid( ( (maxCol ) * (96 * 1.25)),  ( (maxRow) * (96 * 1.25)) ) ;
			_grids.push(g);
			
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
		
		
		scaleToGrowth();
	}
	
}