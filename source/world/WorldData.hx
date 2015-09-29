package world;
import flash.display.BitmapData;
import flixel.FlxG;
import haxe.Json;
import lime.net.oauth.OAuthRequest.KVPair;
import openfl.display.Bitmap;
import sys.io.File;
import flixel.util.FlxMath;
import sys.io.FileOutput;
import haxe.format.JsonPrinter;
import tjson.TJSON;
import haxe.format.JsonParser;
//import world.WorldData.SunTextureData;
import flash.utils.ByteArray;
import flash.geom.Rectangle;

import openfl.Assets;
/**
 * @author null
 * null
 * null
 */
// GH: HAXXOR! Load a computer generated texture to calculate distance to nearest star
//@:bitmap(AssetPaths.rock__png) class SunTextureData extends BitmapData {}
	
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
	
	private var _distanceToSun : Float = 0;
	private var _mass : Float = 0;
	private var _waterW : Float = 0;
	// GH: 
	private var _texture :Bitmap;
	
	// GH: This gets filled later on with the hard data results
	private var _resourcesAvailable : Array<String> = new Array(); // GH: resource names to be on the grid
	
	private var _waterMaxRating :Float = 700;
	
	private var _maxTiles : Int = 0;
	
	private var _waterTiles : Int = 0;
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
		
		
		initWorldDistanceToSun();
		// GH: initialize values
		initWorldSizeValues();
		initResourceValues();
		initWildlifeValues();
		initWorldValues();
		
		// GH: Exponentiate values
		// GH: Generate actual world values
		writeToJSON();
		
		FlxG.log.add(_temperature.toString());
		FlxG.log.add(_water.toString());
		FlxG.log.add(_atmosphere.toString());
		FlxG.log.add(_animal.toString());
		FlxG.log.add(_geo.toString());
		/// GH: Basic world layer of data generation
		// GH: Generate actual world data.
		// GH: Define how much water we will get
		

		_waterTiles = getWaterTiles();
		
		FlxG.log.add("MAX TILES: "+ _maxTiles);
		
	}
	
	private function getMineralTiles() :Int
	{
		var maxRange  :Float  = 0;
		switch (worldSize)
		{
			case "SMALL":
				maxRange += 3;
				
			case "MEDIUM":
				maxRange += 6;
				
			case "BIG":
				maxRange += 9;

		}

		return 0; // 

	}
	
	private function getWaterTiles() : Int
	{
		var maxRange : Float = 0;
		switch(worldSize) 
		{
			case "SMALL":
				maxRange += 3;
				
			case "MEDIUM":
				maxRange += 6;
				
			case "BIG":
				maxRange += 9;
			
		}
				
		var waterRating :Float = maxRange*(_water.coverage / _water.clean);
		return Math.ceil(maxRange * waterRating / _waterMaxRating);
	}
	
	private function initWorldDistanceToSun() :Void
	{
		
		_texture = new Bitmap(Assets.getBitmapData(AssetPaths.rock__png), null, false);
		var midRect :Rectangle = new Rectangle(128, 128, 128, 128 );
		var data :ByteArray = _texture.bitmapData.getPixels(midRect);
		
		
		FlxG.log.add("RectDataSize: " + data.length);
		// GH: Get mass 
		var mX : Int = Math.floor(Math.random() * data.length);
		var mY : Int = Math.floor(Math.random() * 128);

		_mass = data[(mX ) ];
		
		FlxG.log.add(_mass + " MAAAASSS " + " IX: "+ mX + " IY: " + mY );
		
		var wX : Int = Math.floor(Math.random() * data.length);
		var wY : Int = Math.floor(Math.random() * 128);

		_waterW = data[(wX ) ];
		
		FlxG.log.add(_waterW + " WATER " + " IX: " + wX + " IY: " + wY );
		
		var dX : Int = Math.floor(Math.random() * data.length);
		var dY : Int = Math.floor(Math.random() * 128);

		_distanceToSun = data[(dX)];
		
		FlxG.log.add(_distanceToSun + " DISTANCETOSUN " + " DX: "+ dX + " DY: " + dY );
	}
	
	
	private function initWorldSizeValues() :Void
	{
		var sizeOffset : Float = 0;
 		switch(worldSize) 
		{
			case "SMALL":
				sizeOffset += 0.2;
				
			case "MEDIUM":
				sizeOffset += 0.5;
				
			case "BIG":
				sizeOffset += 0.7;
			
		}
				
		_atmosphere.breathable += _distanceToSun + FlxMath.bound(Math.random(), 0.1, 0.5);
		_temperature.heat += sizeOffset + _distanceToSun + _waterW + FlxMath.bound(Math.random(), 0.1, 0.4);
		_geo.metalDensity += (1 - sizeOffset) + _mass + _distanceToSun + FlxMath.bound(Math.random(), 0, 0.3);
		_geo.rockFormation += sizeOffset + _mass + FlxMath.bound(Math.random(), 0, 0.4);
// 		_water.clean += 0.8;
		_water.coverage += sizeOffset - 1 +   _waterW + FlxMath.bound(Math.random(), 0, 0.1);
	}
	
	private function initResourceValues() :Void
	{
		
		var resourceOffset : Float = 0;
		switch(resourceAmount)
		{
			case "SMALL":
				resourceOffset += 0.3;
				_maxTiles  = 9 * 9;
			case "MEDIUM":
				resourceOffset += 0.7;
				_maxTiles  = 13 * 13;
				
			case "BIG":
				resourceOffset += 1.1;
				_maxTiles = 19 * 19;
				
		}

		
				
		_atmosphere.breathable *= resourceOffset + 255 / _distanceToSun + (FlxMath.bound(-Math.random(), -0.15, -0.05));
		_temperature.heat *= resourceOffset + 255 / _distanceToSun + FlxMath.bound(Math.random(), 0.2, 0.3);
		_geo.metalDensity *=  resourceOffset + 255 / _mass + FlxMath.bound(Math.random() - Math.random(), -0.1, 0.4 );
		_geo.rockFormation *= resourceOffset +  255 / _mass + FlxMath.bound(Math.random() , 0.2, 0.3 );
		_water.clean *= resourceOffset + 1 +(FlxMath.bound(-Math.random(), -0.15, -0.05));

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
		//FlxG.log.add(obj);
		var json = TJSON.encode(obj);
		var f : FileOutput = File.write("worldData.json", false);
		f.writeString(json);
	}
	
	public function createWorldMap() :Void
	{
		
	}
}