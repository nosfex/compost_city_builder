package world;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;

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
		for (i in 0 ... worldData.maxTilesGrowth)
		{
			gridIds.push(new Array());
		
			for (j in 0 ... worldData.maxTilesGrowth)
			{
				gridIds[i].push(0);
			}
		}
		
	}
	
	// GH: Create gridIds from the worldData
	private function generateMapResourcesData() :Void
	{
		
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