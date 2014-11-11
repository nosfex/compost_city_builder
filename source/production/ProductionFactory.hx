package production;
import buildings.Building;
import clones.Clone;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.io.Error;
import openfl.utils.Object;

/**
 * ...
 * @author Gerardo Heidel
 */
class ProductionFactory
{

	private static var _privCon :Bool = true;
	private static var _instance :ProductionFactory = null;
	public function new() 
	{
		if (_privCon)
		{
			//throw new Error("use singleton");
		}
	}
	
	public static function instance() :ProductionFactory 
	{
		if (_instance == null)
		{
			_privCon = false;
			_instance = new ProductionFactory();
			_privCon = true;
		}
		return _instance;
	}
	
	public function buildProduct(type :String, originPos : FlxPoint, parent :Building) : FlxSprite
	{
		switch(type)
		{
			case "clone":
				var c :Clone = new Clone(originPos.x, originPos.y);
				c.setProductionParent(parent);
				return c;
			
			
			
		}
		
		return null;
	}
}