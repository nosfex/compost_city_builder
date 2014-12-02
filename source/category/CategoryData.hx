package category;
import haxe.Json;
import openfl.net.URLLoader;
import openfl.net.URLRequest;

/**
 * ...
 * @author Gerardo Heidel
 */
class CategoryData
{
	
//	public var headlines(get,set) : Map < String, Array<String> > ;
	private var _headlines :Map<String, Array<String>> =  new Map();
//	var p : URLLoader = new URLLoader(new URLRequest("../../assets/data/category.json");
	private var _categoryJson :String = '{ "headlines":["Energy", "Production", "Housing"],
										  "buildings":[ { "owner":"Energy", "buildings":["Power Plant", "Power Line"] },
														{ "owner":"Production", "buildings": ["Slave Agency", "techfactory"] },
														{ "owner":"Housing", "buildings": ["Clone Center", "richhood"] }]}';
	public function new() 
	{
		loadJson();
	}
	
	
	public function loadJson() : Void
	{
		var jsonCategories :Dynamic = Json.parse(_categoryJson);
		
		for (i in 0 ... jsonCategories.headlines.length)
		{	
			_headlines.set(jsonCategories.headlines[i], jsonCategories.buildings[i].buildings);
		}
	}
	
	
	public function getHeadlines() : Map < String, Array<String> >
	{
		return _headlines;
	}
	
	
}