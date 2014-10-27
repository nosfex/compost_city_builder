package buildings;
import flixel.util.FlxPoint;
import haxe.Json;
import buildings.Building;
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
	private var _jsonFile :String = 
	'{"buildings":[{"requiresPower": false, "area":"N4", "techLevel":0, "productionType":"power", "productionRate":1, "name":"Power Plant","lockTile":true, "buildingMaxDmg":3},{"requiresPower": true, "area":"N4", "techLevel":0, "productionType":"power", "productionRate":1, "name":"Power Line","lockTile":false, "buildingMaxDmg":3}]}';
	public function new() 
	{
		//_buildingData = new Map
		if (_privCon)
		{
		//	throw new Error("singleton");
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
		var jsonBuildings :Dynamic = Json.parse(_jsonFile);
		//var buildings :Array<BuildingData> = cast(jsonBuildings.buildings, Array<BuildingData>);
		
		for (i in 0 ... jsonBuildings.buildings.length)
		{
			
			var bData : BuildingData = new BuildingData();
			bData.name = (jsonBuildings.buildings[i]).name;
			bData.area = (jsonBuildings.buildings[i]).area;
			bData.lockTile = (jsonBuildings.buildings[i]).lockTile;
			bData.techLevel = (jsonBuildings.buildings[i]).techLevel;
			bData.requiresPower = (jsonBuildings.buildings[i]).requiresPower;
			bData.productionRate = (jsonBuildings.buildings[i]).productionRate;
			bData.productionType = (jsonBuildings.buildings[i]).productionType;
			bData.buildingMaxDmg = (jsonBuildings.buildings[i]).buildingMaxDmg;
			_buildingData.arrayWrite(bData.name, bData);
		}
	}
	
	public function createBuildingInstance() :Building
	{
		

		if(CURRENT_BUILDING == "")
		{
			return null;
		}
		

		var graphic :Dynamic = null;
		switch (CURRENT_BUILDING)
		{
			case "Power Plant":
				graphic = AssetPaths.power_plant_0__png;

		}
		var b :Building = new Building(0, 0, graphic);

		b.load(_buildingData[CURRENT_BUILDING]);
		return b;
	}
	
}