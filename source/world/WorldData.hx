package world;
import flash.display.BitmapData;
import flixel.FlxG;
import flixel.util.FlxMath;

/**
 * @author null
 * null
 * null
 */
class WorldData
{
	// GH: Generation presets. How hard does the planet has to be?
	public static var worldSize : String = "MEDIUM"; // GH: Determines how many grids max. Determines a wild bunch of stuff for geo data
	public static var resourceAmount : String = "MEDIUM"; // GH: Geo data + water modifier
	public static var wildLife : String = "FEW"; // GH: Decorates the world. Always a scavenger poblation. Sometimes warrior population. Sometimes Giant monsters
	public static var funGenerator :String = "BORING"; // GH: Level of out of place effects on the world. Orbital cannons, random world eruptions
	// GH: Season data
	
	// GH: Hard data generators
	private var _temperature :TemperatureData;
	private var _atmosphere :AtmosphereData;
	private var _water : WaterData;
	private var _geo :GeologicalData;
	private var _animal :AnimalData;
	
	// GH: This gets filled later on with the hard data results
	private var _resourcesAvailable : Array<String> = new Array(); // GH: resource names to be on the grid
	
	// GH: Wildling data
	public function new() 
	{
		
	}	
	
	public function init() :Void
	{
		// GH: The game always starts with a 3x3 grid. Defining a max of grids for the world will limit the user expansion.
		_temperature 	= new TemperatureData();
		_water 			= new WaterData();
		_geo 			= new GeologicalData();
		_atmosphere 	= new AtmosphereData();
		_animal 		= new AnimalData();
		
		// GH: initialize values
		
		switch(worldSize) 
		{
			case "SMALL":
				_atmosphere.breathable += .3 + FlxMath.bound(Math.random(), 0.1, 0.5);
				_temperature.heat += 0.6 + FlxMath.bound(Math.random(), 0.1, 0.4);
				_geo.metalDensity += 0.7 + FlxMath.bound(Math.random(), 0, 0.3);
				_geo.rockFormation += 0.1 + FlxMath.bound(Math.random(), 0, 0.4);
				_water.clean += 0.8;
				_water.coverage += 0.2 + FlxMath.bound(Math.random(), 0, 0.1);
				
			case "MEDIUM":
				_atmosphere.breathable += .5 + FlxMath.bound(Math.random(), 0.1, 0.25);
				_temperature.heat += 0.5 + FlxMath.bound(Math.random(), 0.1, 0.4);
				_geo.metalDensity += 0.5 + FlxMath.bound(Math.random(), 0, 0.3);
				_geo.rockFormation += 0.4 + FlxMath.bound(Math.random(), 0, 0.4);
				_water.clean += 0.8;
				_water.coverage += 0.4 + FlxMath.bound(Math.random(), 0, 0.2);
				
			case "BIG":
				_atmosphere.breathable += .6 + FlxMath.bound(Math.random(), 0.1, 0.3);
				_temperature.heat += 0.4 + FlxMath.bound(Math.random(), 0.1, 0.4);
				_geo.metalDensity += 0.3 + FlxMath.bound(Math.random(), 0, 0.6);
				_geo.rockFormation += 0.6 + FlxMath.bound(Math.random(), 0, 0.4);
				_water.clean += 0.8;
				_water.coverage += 0.6 + FlxMath.bound(Math.random(), 0, 0.3);
			
		}
		
		// GH: Exponentiate values
		
		switch(resourceAmount)
		{
			case "SMALL":
				_atmosphere.breathable *= 1 + (FlxMath.bound(-Math.random(), -0.15, -0.05));
				_temperature.heat *= 1 + FlxMath.bound(Math.random(), 0.1, 0.2);
				_geo.metalDensity *= 0.7 + FlxMath.bound(Math.random() - Math.random(), -0.1, 0.2 );
				_geo.rockFormation *= 1 + FlxMath.bound(Math.random() - Math.random(), -0.2, 0.1 );
				_water.clean *= 1;
				
			case "MEDIUM":
				_atmosphere.breathable *= 0.95 + (FlxMath.bound(-Math.random(), -0.15, -0.05));
				_temperature.heat *= 1 + FlxMath.bound(Math.random(), 0.2, 0.3);
				_geo.metalDensity *= 0.9 + FlxMath.bound(Math.random() - Math.random(), -0.1, 0.4 );
				_geo.rockFormation *= 1 + FlxMath.bound(Math.random() , 0.2, 0.3 );
				_water.clean *= 1 +(FlxMath.bound(-Math.random(), -0.15, -0.05));
				
			case "BIG":
				_atmosphere.breathable *= 0.9 + (FlxMath.bound(-Math.random(), -0.15, -0.05));
				_temperature.heat *= 1.1 + FlxMath.bound(Math.random(), 0.2, 0.3);
				_geo.metalDensity *= 1 + FlxMath.bound(Math.random() - Math.random(), -0.1, 0.4 );
				_geo.rockFormation *= 1.1 + FlxMath.bound(Math.random() , 0.2, 0.3 );
				_water.clean *= 0.9 +(FlxMath.bound(-Math.random(), -0.15, -0.05));
		}

		_atmosphere.gravitySupport += _atmosphere.breathable + _geo.metalDensity + _geo.rockFormation;

		var sizeOffset :Float = 0;
		var aggroOffset :Float = 0;
		var evoOffset :Float = 0;
		switch(wildLife)
		{
			case "FEW": 
				sizeOffset = .75;
				aggroOffset = 1.2;
				evoOffset = .5;
			case "MODERATE":
				sizeOffset = .95;
				aggroOffset = 1;
				evoOffset = .6;
			case "ZOO":
				sizeOffset = 1.2;
				aggroOffset = 1;
				evoOffset = .5;
			
		}
		
		_animal.populationSize = (_atmosphere.breathable + _water.clean + _temperature.heat + _water.coverage) * sizeOffset;
		_animal.evolutionaryStage = _atmosphere.breathable - (_geo.metalDensity * evoOffset) + _water.clean + _water.coverage + _atmosphere.breathable + _atmosphere.gravitySupport;
		_animal.atemporality = _atmosphere.breathable + _atmosphere.gravitySupport ;
		_animal.agressiveness = _geo.metalDensity / .5 + (_geo.rockFormation + _water.clean / _water.coverage) * aggroOffset;
				
		
	}
	
	public function createWorldMap() :Void
	{
		
	}
}