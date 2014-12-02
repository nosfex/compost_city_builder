package ;
import grid.GridMap;
import Map;

/**
 * ...
 * @author Gerardo Heidel
 */
class CompostG
{

	public function new() 
	{
		
	}
	
	public static var FUNC_BUTTON : String = "";
	public static var GRID_MAP :GridMap = null;
	
	
	private static var _products : Map<String, Int> = new Map<String, Int>();
	public static function updateProductAmount(prodType :String, amount : Int) :Void
	{
		_products[prodType] += amount;
	}
	
	public static function getProductAmountByType(prodType :String) :Int
	{
		return _products[prodType];
	}
}