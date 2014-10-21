package buildings;
import flixel.util.FlxPoint;
import haxe.Json;

/**
 * ...
 * @author Gerardo Heidel
 */
class BuildingFactory
{

	private var _buildingData :Map<String, BuildingData> = new Map();
	private var _jsonFile :String = 
	'{"buildings":[{"requiresPower": false, "area":"N4", "techLevel":0, "productionType":"power", "productionRate":1, "name":"Power Plant","lockTile":true, "buildingMaxDmg":3},{"requiresPower": true, "area":"N4", "techLevel":0, "productionType":"power", "productionRate":1, "name":"Power Line","lockTile":false, "buildingMaxDmg":3}]}';
	public function new() 
	{
		//_buildingData = new Map
		loadJson();
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
			_buildingData.arrayWrite(bData.name, bData);
			//trace(bData.name);
		}
	}
	
	public function createBuildingInstance(buildingName :String, pos :FlxPoint) :Building
	{
		
		return null;
	}
	
}