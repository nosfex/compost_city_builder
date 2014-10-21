package grid;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;
import flixel.FlxG;
import buildings.Building;
import flixel.util.FlxRect;
/**
 * ...
 * @author Gerardo Heidel
 */
class BaseGrid extends FlxSpriteGroup
{

	
	public var usable(get, set) : Bool;
	
	public var powered(get, set) :Bool;
	
	private var _usable :Bool = false;
	
	private var _buildings :Array<Building> = new Array();
	private var _base :FlxSprite;
	
	private var _power :Bool;
	public function new(X:Float = 0, Y:Float = 0, MaxSize:Int = 0)
	{
		super(X, Y, MaxSize);
		_base = new FlxSprite(x, y, null);
		_base.makeGraphic(96, 96, 0x5500FF90);
		_base.origin = new FlxPoint();
		//_base.alpha = 0.5;
		alpha = 0.5;
		add(_base);
		_power = false;
	}
	
	public function get_powered() :Bool { return _power; }
	public function set_powered(value) :Void { _power = value; }
	
	public function get_usable() :Bool { return _usable; }
	
	public function set_usable(value) 
	{
		_usable = value;
		alpha = _usable ? 1 : 0.5;
		return _usable;
	}
	
	
	public function addBuilding(b :Building) : Void
	{
		
	}
	
	public function setData(value :GridData) :Void
	{
		
	}
	
	override public function update():Void
    {
        super.update();
	/*	_base.x = x;
		_base.y = y;
		_base.scale = scale;
		_base.alpha = alpha;*/
		for (i in 0 ... members.length)
		{
			members[i].x = x;
			members[i].y = y;
			members[i].scale = scale;
			members[i].alpha = alpha;
		}
		if (FlxG.mouse.justPressed)
		{
			var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(x, y, width * scale.x, height * scale.y);
			if (p.inFlxRect(r))
			{
				trace("clickety clack");
			}
		}
    }

    override public function destroy():Void
    {
        super.destroy();
    }
	
	
}