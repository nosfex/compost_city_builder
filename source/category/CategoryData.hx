package category;
import haxe.Json;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import sys.io.File;

/**
 * ...
 * @author Gerardo Heidel
 */
class CategoryData
{
	private var _headlines :Map<String, Array<String>> =  new Map();
	public function new() 
	{
		loadJson();
	}
	
	public function loadJson() : Void
	{
		var categoryFile : String = File.getContent(AssetPaths.category_data__json);
		var jsonCategories :Dynamic = Json.parse(categoryFile);
		
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