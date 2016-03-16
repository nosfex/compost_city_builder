package world;

import cpp.Void;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;
import grid.BaseGrid;

/**
 * ...
 * @author ...
 */
class World extends FlxSpriteGroup
{

	
	static public var SUMMER :String = "SUMMER";
	static public var WINTER :String = "WINTER";
	static public var AUTUMN :String = "AUTUMN";
	static public var SPRING :String = "SPRING";
	
	@:isVar public var currentCycle(default, default) : Int = 0;
	@:isVar public var currentSeason(default, default) : String = World.SUMMER;
	@:isVar public var worldTimer : FlxTimer = null;
	@:isVar public var worldData :WorldData;
	
	@:isVar public var gridIds(default, default) : Array<Array<Int>> = null;
	
	public function new(X:Float=0, Y:Float=0, MaxSize:Int=0) 
	{
		super(X, Y, MaxSize);
		
		// GH: initiate season timer
		worldTimer = new FlxTimer();
		worldTimer.start(5, onTimerCycleOver, 0);
		
		// GH: Initiate worldData generator
		worldData = new WorldData();
		worldData.init();
		
		gridIds = new Array();
		
	
		
		//gridIds.push(new Array());
	}
	
	// GH: Create gridIds from the worldData
	private function generateMapResourcesData(initialSize : Int) :Void
	{
		var maxGrids:Float = Math.sqrt(initialSize);
    	var col:Int = cast maxGrids;
    	var row:Int = cast maxGrids;
		
		
		for ( i in 0 ... col)
		{
			gridIds.push(new Array());
			for ( j in 0 ... row)
			{
				gridIds[i].push(0);
			}
		}
		// GH: Start with the initial values
		// GH: Force the center tile to be a usable one for the headquarter
		gridIds[1][1] = BaseGrid.NORMAL_GRID;
		
		for (i in 0 ... worldData.maxTilesGrowth)
		{
			addGrids();
		}
		
		// GH: Make mineral bodies first. Depends on how massive the world is + amount of minerals determined by the world data
	}
	
	private function addGrids() : Void
	{
		var maxRow :Int = gridIds[0].length  + 2;
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
				temp[i].push(0);
			}
		}
			
		
		// GH: Copy the old shit
		for(i in 1 ... maxRow - 1)
		{
			for (j in 1 ... maxCol - 1)
			{
				// GH: Temp now has the old data
				temp[i][j] = gridIds[i-1][j-1];
			}
		}
		
		gridIds = temp;
	}
	
	
	
	override public function update(elapsed :Float)
	{
		super.update(elapsed);
	}
	
	public function onTimerCycleOver(Timer :FlxTimer) :Void
	{
	
		if (currentCycle > 3) currentCycle = 0;
		
		// GH: Switch season according to the cycle
		switch(currentCycle)
		{
			case 0 : 
				currentSeason = World.SUMMER;
			case 1 : 
				currentSeason = World.AUTUMN;
			case 2 : 
				currentSeason = World.WINTER;
			case 3 : 
				currentSeason = World.SPRING;
		}
		
		currentCycle++;
		
	}
	
}