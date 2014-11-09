package production;
import haxe.io.Error;

/**
 * ...
 * @author Gerardo Heidel
 */
class ProductionFactory
{

	private static var _privCon :Bool =true;
	private static var _instance :ProductionFactory = null;
	public function new() 
	{
		if (_privCon)
		{
			throw new Error("use singleton");
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
	}
}