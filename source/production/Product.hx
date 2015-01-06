package production;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import buildings.Building;
/**
 * @author null
 * null
 * null
 */
class Product extends FlxSprite
{
	
	public var gotoPos(get, set) : FlxPoint;
	public var productType(get, set) :String;
	
	public var flxColRect(get, set) : FlxRect;
	public var prodParent(get, set) : Building;
	
	public var _flxColRect :FlxRect;
	
	private var _prodParent :Building = null;
	private var _gotoPos : FlxPoint = null;
	private var _useFromBuilding :Building = null;
	private var _productType :String;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		_gotoPos = null;
	}	
	
	
	
	
	public function use(fromBuilding :Building) :Void
	{
		_useFromBuilding = fromBuilding;
	}
	
	public override function update() :Void
	{
		super.update();
	}
	
	public function get_prodParent() :Building { return _prodParent; }
	public function set_prodParent(value :Building) { _prodParent = value; return _prodParent; }
	
	public function get_gotoPos() :FlxPoint 	{ return _gotoPos; } 
	public function set_gotoPos(pos :FlxPoint) :FlxPoint { _gotoPos = pos; trace("@gotopos"); return _gotoPos; }
	
	public function get_flxColRect() :FlxRect { return _flxColRect; }
	public function set_flxColRect(value :FlxRect) { _flxColRect = value; return _flxColRect; }
	
	public function get_productType() :String { return _productType; }
	public function set_productType(value :String) :String { _productType = value; return _productType; }
	
}