	package buildings;
import flixel.util.FlxPoint;
import haxe.Json;
import buildings.Building;
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
			bData.availableFunctions = (jsonBuildings.buildings[i]).functions;
			FlxG.log.add("BUILDING FUNCTIONS: " + bData.availableFunctions );
			
			_buildingData.arrayWrite(bData.name, bData);
		}
	}
	
	public function createBuildingInstance() :Building
	{
		if(CURRENT_BUILDING == "")
		{
			return null;
		}
		
		if (FlxG.mouse.screenX >=FlxG.width * .75)
			return null;
		
		if (_buildingData[CURRENT_BUILDING].price > CompostG.getProductAmountByType("money"))
			return null;
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
		}
		var b :Building = new Building(0, 0, graphic);
		trace("CURRENT_BUILDING" + CURRENT_BUILDING);
		b.load(_buildingData[CURRENT_BUILDING]);
		
		CompostG.updateProductAmount("money", - _buildingData[CURRENT_BUILDING].price);
		return b;
	}
	
}