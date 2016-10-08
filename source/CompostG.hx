package ; 
import camera.CameraController;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.math.FlxRect;
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
	
	// GH: Returns if the mouse is passing over something. Gotta stop ctrl+c+v stuff
	public static function getMouseOverRect(source : FlxSprite, ?posOffset: FlxPoint = null, ?sizeOffset :FlxPoint = null ) :Bool
	{
		if (posOffset == null) posOffset = new FlxPoint();
		if (sizeOffset == null) sizeOffset = new FlxPoint(1, 1);
		
		var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
		var r :FlxRect = new FlxRect(source.x + posOffset.x, source.y + posOffset.y, source.width * sizeOffset.x , source.height * sizeOffset.y);
		
		if (r.containsPoint(p))
		{
			return true;
		}
		return false;
	}
	
	// GH: Whenever the player completes a task, give them a reward
	public static function cashReward(type : String, amount : Int) : Void
	{
		//switch(type)
		{
			// GH: Maybe there is a special case where we don't add production (:
		//	case default: 
				CompostG.updateProductAmount(type, amount);
			//	break;
			
		}
	}
}