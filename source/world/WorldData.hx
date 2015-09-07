package world;
import flash.display.BitmapData;
import flixel.FlxG;
import haxe.Json;
import sys.io.File;
import flixel.util.FlxMath;
import sys.io.FileOutput;
import haxe.format.JsonPrinter;
import tjson.TJSON;
import haxe.format.JsonParser;

/**
 * @author null
 * null
 * null
 */
class WorldData
{
	// GH: Generation presets. How hard does the planet has to be?
	public static var worldSize : String = "BIG"; // GH: Determines how many grids max. Determines a wild bunch of stuff for geo data
	public static var resourceAmount : String = "BIG"; // GH: Geo data + water modifier
	public static var wildLife : String = "ZOO"; // GH: Decorates the world. Always a scavenger poblation. Sometimes warrior population. Sometimes Giant monsters
	public static var funGenerator :String = "BORING"; // GH: Level of out of place effects on the world. Orbital cannons, random world eruptions
	// GH: Season data
	
	// GH: Hard data generators
	private var _temperature :TemperatureData;
	private var _atmosphere :AtmosphereData;
	private var _water : WaterData;
	private var _geo :GeologicalData;
	private var _animal :AnimalData;
	
	@:isVar public var supportsLife(default, default)  :Float = 0;
	@:isVar public var superMinerals(default, default) :Float = 0;
	@:isVar public var climaticPhenomena(default, default) :Float = 0;
	@:isVar public var celestialBodies(default, default) :Float = 0;
	
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
		initWorldSizeValues();
		initResourceValues();
		initWildlifeValues();
		initWorldValues();
		
		// GH: Exponentiate values
		// GH: Generate actual world values
		writeToJSON();
	}
	
	private function initWorldSizeValues() :Void
	{
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
	}
	
	private function initResourceValues() :Void
	{
		
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
	}
	
	private function initWildlifeValues() :Void
	{
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
	
	private function initWorldValues() :Void
	{
		supportsLife 	+= (_animal.populationSize + _atmosphere.breathable) / _temperature.heat + (_water.clean + _water.coverage) / _atmosphere.gravitySupport ;
		superMinerals 	+= (_geo.metalDensity + _geo.rockFormation) / _water.coverage + (_atmosphere.gravitySupport + _geo.metalDensity) / _temperature.heat;
		climaticPhenomena += supportsLife + superMinerals + _geo.rockFormation + _water.coverage;
		celestialBodies += 1 * (_geo.metalDensity + _atmosphere.gravitySupport + _geo.rockFormation);
	}
	
	private function writeToJSON() :Void
	{
		var obj = 
		{
			worldSize:WorldData.worldSize,
			resourceAmount:WorldData.resourceAmount,
			wildLife:WorldData.wildLife,
			lifeSupport:supportsLife,
			mineralsEx:superMinerals,
			climatic:climaticPhenomena,
			meteors:celestialBodies,
			animalData: { populationSize:_animal.populationSize, evolutionaryStage:_animal.evolutionaryStage, agressiveness:_animal.agressiveness, atemporality:_animal.atemporality },
			temperature: { heat:_temperature.heat },
			water: { clean:_water.clean, coverage:_water.coverage },
			atmosphere: { breathable:_atmosphere.breathable, gravitySupport:_atmosphere.gravitySupport },
			geological: { metalDensity:_geo.metalDensity, rockFormation:_geo.rockFormation }
			
		};
		
		var json = TJSON.encode(obj);
		var f : FileOutput = File.write("worldData.json", false);
		f.writeString(json);
	}
	
	public function createWorldMap() :Void
	{
		
	}
}