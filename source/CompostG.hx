package ;
import camera.CameraController;
import flixel.group.FlxSpriteGroup;
import grid.GridMap;
import gui_selector.Selector;
import Map;

/**
 * ...
 * @author Gerardo Heidel
 */
class CompostG
{

	public static var FUNC_BUTTON : String = "";
	public static var GRID_MAP :GridMap = null;

	
	
	// GH: cam controller
	public static var CAM : CameraController = null;
	
	// GH: UI accessor
	public static var UI_SELECTOR : Selector = null;
	
	// GH: Book keeping of produced resources
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