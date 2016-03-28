package world;

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
	public function generateMapResourcesData(initialSize : Int) :Void
	{
		var maxGrids:Float = cast Math.sqrt(initialSize);
    	var col:Int = cast maxGrids;
    	var row:Int = cast maxGrids;
		
		
		for ( i in 0 ... col)
		{
			gridIds.push(new Array());
			for ( j in 0 ... row)
			{
				gridIds[i].push(BaseGrid.NORMAL_GRID);
			}
		}
		// GH: Start with the initial values
		
		for (i in 0 ... (worldData.maxTilesGrowth - col))
		{
			addGrids();
		}
		
		// GH: Make mineral bodies first. Depends on how massive the world is + amount of minerals determined by the world data
		fillTilesWithType(BaseGrid.WATER_GRID, worldData.waterTiles);
		fillTilesWithType(BaseGrid.MINERAL_GRID, worldData.mineralTiles);
		
		var midRow : Int = cast Math.floor(gridIds.length / 2);
		
		// GH: Force the center tile to be a usable one for the headquarter
		gridIds[midRow][midRow] = BaseGrid.NORMAL_GRID;
		
	}
	
	public function getIDMapForSize(size : Int) :Array<Array<Int>>
	{
		// GH: Start in the fucking middle.
		var midRow : Int = cast Math.floor(gridIds.length / 2);
		var midCol :Int = midRow;
		
		var copyArray :Array<Array<Int>> = new Array();
		var rootSize :Int = (size);
		// GH: Generate a copy array to store the new data ;
		for (i in 0 ... rootSize )
		{
			copyArray.push( new Array());
			for (j in 0 ... rootSize)
			{
				copyArray[i].push(BaseGrid.NORMAL_GRID);
			}
		}
		// GH: close in to the upper left then expand to the lower right
		// Get half the rootSize 
		// [x-1-1][x-1-0][x-1+1]    
		// [x-0-1][x-0-0][x-0+1] 
		// [x+1-1][x+1-0][x+1+1]
		
		// GH: get half size from the fully generated gridIds
		var centerTile : Int = cast Math.floor( (gridIds.length) / 2 ); 
		
		var negHalfSize :Int = cast -Math.floor( rootSize / 2);
		FlxG.log.add("ROOTSIZE: " + rootSize);
		FlxG.log.add("CenterTile: " + centerTile);
		//FlxG.log.add("Failing @ copyArray: " + negHalfSize );
		
		for (i in negHalfSize ... -negHalfSize)
		{
			for (j in negHalfSize ... -negHalfSize)
			{
				copyArray[i -negHalfSize][j - negHalfSize] = gridIds[i + centerTile][j + centerTile];
			}
		}
		
		return copyArray;
	}
	
	// GH: Fills the tiles with data
	private function fillTilesWithType(type :Int, count : Int) :Void
	{
		FlxG.log.add("Filling: " + type + " Count: " + count );
		for ( i in 0 ... count)
		{
			var rCol : Int = cast (Math.floor(Math.random() * gridIds.length));
			var rRow : Int = cast (Math.floor(Math.random() * gridIds[rCol].length));
			// GH: If this tile is already set with another type, keep randoing till we get a free pos
			while (gridIds[rCol][rRow] != BaseGrid.NORMAL_GRID)
			{
				rCol = cast (Math.floor(Math.random() * gridIds.length));
				rRow = cast (Math.floor(Math.random() * gridIds[rCol].length));
			}
			
			// GH: Setting type
			FlxG.log.add("TYPE: " + type);
			gridIds[rCol][rRow] = type;
			
		}
		
	}
	
	private function addGrids() : Void
	{
		var maxRow :Int = gridIds[0].length  + 2;
		var maxCol :Int = maxRow;
		
		// GH: Create new grid
		var temp : Array<Array<Int>> = new Array();
		
		for (i in 0 ... maxRow)
		{
			temp[i] = new Array();
		}
		// GH: create a new map and fill it with rubbish
		for (i in 0 ... maxRow)
		{
			for (j in 0 ... maxCol)
			{
				temp[i].push(BaseGrid.NORMAL_GRID);
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