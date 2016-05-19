	package buildings;
import flixel.math.FlxPoint;
import haxe.Json;
import buildings.Building;
import openfl.errors.Error;

import sys.io.FileInput;
import sys.io.File;
import haxe.io.Eof;
import flixel.FlxG;
//import haxe.io.Error;

/**
 * ...
 * @author Gerardo Heidel
 */
class BuildingFactory
{

	private static var _privCon :Bool =true;
	private static var _instance :BuildingFactory = null;
	public static var CURRENT_BUILDING :String = "";
	private var _buildingData :Map<String, BuildingData> = new Map();
	
	public function new() 
	{
		if (_privCon)
		{
			throw new Error("use instance");
		}

		loadJson();
	}
	
	public static function instance() :BuildingFactory
	{
		if(_instance == null)
		{
			_privCon = false;
			_instance = new BuildingFactory();
			_privCon = true;
		}
		return _instance;
	}
	
	public function loadJson() :Void
	{
		var fileContent = File.getContent(AssetPaths.buildings_data__json);
		var jsonBuildings :Dynamic = Json.parse(fileContent);
		
		for (i in 0 ... jsonBuildings.buildings.length)
		{	
			var bData : BuildingData = new BuildingData();
			bData.name 				= (jsonBuildings.buildings[i]).name;
			bData.area 				= (jsonBuildings.buildings[i]).area;
			bData.lockTile 			= (jsonBuildings.buildings[i]).lockTile;
			bData.techLevel 		= (jsonBuildings.buildings[i]).techLevel;
			bData.requiresPower 	= (jsonBuildings.buildings[i]).requiresPower;
			bData.productionRate 	= (jsonBuildings.buildings[i]).productionRate;
			bData.productionType 	= (jsonBuildings.buildings[i]).productionType;
			bData.buildingMaxDmg 	= (jsonBuildings.buildings[i]).buildingMaxDmg;
			bData.maxProduction 	= (jsonBuildings.buildings[i]).maxProduction;
			bData.maxManPower		= (jsonBuildings.buildings[i]).maxManPower;
			bData.requiresManPower	= (jsonBuildings.buildings[i]).requiresManPower;
			bData.price 			= (jsonBuildings.buildings[i]).price;
			bData.upkeepCost 		= (jsonBuildings.buildings[i]).upkeepCost;
			bData.currency			= (jsonBuildings.buildings[i]).currency;
			bData.availableFunctions = (jsonBuildings.buildings[i]).functions;
			bData.description = (jsonBuildings.buildings[i]).description;
			FlxG.log.add("BUILDING FUNCTIONS: " + bData.availableFunctions );
			
			_buildingData.arrayWrite(bData.name, bData);
		}
	}
	
	public function getBuildingDescription(name : String) :String
	{
		return _buildingData[name].description;
	}
	
	public function getBuildingPrice(name : String) : String
	{
		var price :String = "";
		for (i in 0 ... _buildingData[name].upkeepCost.length)
		{
			price +=  _buildingData[name].currency[i] + ": " +  _buildingData[name].upkeepCost[i] + " ";
		}
		return price;
	}
	
	public function createBuildingInstance() :Building
	{
		// GH: Sanity checks
		if(CURRENT_BUILDING == "")
		{
			return null;
		}
		
		/// GH: ???
		if (FlxG.mouse.screenX >=FlxG.width * .75)
			return null;
		
		// GH: Check if the user has enough money to get the building
		for (i in 0 ...  _buildingData[CURRENT_BUILDING].upkeepCost.length)
		{
			if (_buildingData[CURRENT_BUILDING].upkeepCost[i] > CompostG.getProductAmountByType(_buildingData[CURRENT_BUILDING].currency[i]))
			{
				return null;
			}
		}
		
		// GH: Graphic asset assignment
		var graphic :Dynamic = null;
		switch (CURRENT_BUILDING)
		{
			case "Power Plant":
				graphic = AssetPaths.power_plant_0__png;
			case "Power Line":
 				graphic = AssetPaths.power_line_0__png;	
			case "Clone Center":
				graphic = AssetPaths.clone_hab_center_0__png;
			case "Slave Agency":
				graphic = AssetPaths.slave_center_0__png;
			case "Headquarters":
				graphic = AssetPaths.headquarters_0__png;
			case "Mineral Extractor":
				graphic = AssetPaths.mineral_extractor__png;
			case "Water Extractor":
				graphic = AssetPaths.water_extractor__png;
		}
		// GH: Create the building
		var b :Building = new Building(0, 0, graphic);
		trace("CURRENT_BUILDING" + CURRENT_BUILDING);
		b.load(_buildingData[CURRENT_BUILDING]);
		
		// GH: Make em pay
		for (i in 0 ...  _buildingData[CURRENT_BUILDING].upkeepCost.length)
		{
			CompostG.updateProductAmount(_buildingData[CURRENT_BUILDING].currency[i], - _buildingData[CURRENT_BUILDING].upkeepCost[i]);
		}
		return b;
	}
	
}