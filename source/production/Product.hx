package production;
import flixel.FlxSprite;
import flixel.util.FlxRect;
import buildings.Building;
/**
 * @author null
 * null
 * null
 */
class Product extends FlxSprite
{
	public var flxColRect(get, set) : FlxRect;
	public var prodParent(get, set) : Building;
	
	public var _flxColRect :FlxRect;
	
	public var _prodParent :Building = null;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
	}	
	
	public function set_prodParent(value :Building)
	{
		
		_prodParent = value;
		return _prodParent;
	}
	
	public override function update() :Void
	{
		super.update();
	}
	
	public function get_prodParent() :Building { return _prodParent; }
	
	
	public function get_flxColRect() :FlxRect { return _flxColRect; }
	public function set_flxColRect(value :FlxRect) { _flxColRect = value; return _flxColRect; }
	
}