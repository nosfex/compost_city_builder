package world;

/**
 * @author null
 * null
 * null
 */
class WorldData
{
	private var _worldSize : String = "MEDIUM";
	private var _indigenousLifeSize : Float;
	private var _resourcesAvailable : Array<String> = new Array(); // GH: resource names to be on the grid
	private var _airQuality : Float;
	private var _pollution : Float;
	private var _landscape : String = "ROCKY"; // Rocky, arid, Jungle, Humid, plains, taiga
	private var _mountainElevation : Int  = 0; // 0 = no mountain, 1 = some, 2 = lots
	private var _water
	
	public function new() 
	{
		
	}	
	
	public function init() :Void
	{
		
		
	}
}