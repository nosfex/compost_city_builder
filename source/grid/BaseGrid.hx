package grid;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;
import flixel.FlxG;
import buildings.Building;
import buildings.BuildingFactory;
import flixel.util.FlxRect;
/**
 * ...
 * @author Gerardo Heidel
 */
class BaseGrid extends FlxSpriteGroup
{

	
	public var usable(get, set) : Bool;
	
	
	private var _usable :Bool = false;
	
	private var _building :Building = null;
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
	
	public function isPowered() :Bool { return _power; }
	public function setPowered(value :Bool)  { _power = value; }

	public function getBuilding() :Building { return _building;}
	
	public function get_usable() :Bool { return _usable; }
	
	public function set_usable(value) 
	{
		_usable = value;
		alpha = _usable ? 1 : 0.5;
		return _usable;
	}
	
	
	public function addBuilding(b :Building) : Void
	{
		if(b == null)
		{
			return;
		}
		
		_building = b;
		add(b);
		
// 		if(b.requiresPower == false)
		{
			this.setPowered(true);
			b.setPowered(true);

		}
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
	
		if (FlxG.mouse.justPressed)
		{
			var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(x, y, width * scale.x, height * scale.y);
			if (p.inFlxRect(r))
			{
				
				trace("clickety clack");

				addBuilding(BuildingFactory.instance().createBuildingInstance());


			}
		}


		for (i in 0 ... members.length)
		{
			members[i].x = x;
			members[i].y = y;
			members[i].scale = scale;
			members[i].alpha = alpha;
		}

		if(_power)
		{
			alpha = 1;

		}

    }

    override public function destroy():Void
    {
        super.destroy();
    }
	
	
}