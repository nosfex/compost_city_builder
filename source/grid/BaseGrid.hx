package grid;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.util.FlxRect;
/**
 * ...
 * @author Gerardo Heidel
 */
class BaseGrid extends FlxSprite
{

	
	public var usable(get, set) : Bool;
	
	private var _usable :Bool = false;
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(96, 96, 0x5500FF90);
		origin = new FlxPoint();
		alpha = 0.5;
	}
	
	
	public function get_usable() :Bool { return _usable; }
	
	public function set_usable(value) 
	{
		_usable = value;
		alpha = _usable ? 1 : 0.5;
		return _usable;
	}
	
	public function setData(value :GridData) :Void
	{
		
	}
	
	override public function update():Void
    {
        super.update();
		
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