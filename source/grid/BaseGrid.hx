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
	public var forceCheck(get, set) : Bool;
	
	private var _usable :Bool = false;
	
	private var _building :Building = null;
	private var _base :FlxSprite;
	
	private var _power :Bool;
		
	private var _forceCheck : Bool = false;
	private var _powerIcon :FlxSprite = null;
	
	public function new(X:Float = 0, Y:Float = 0, MaxSize:Int = 0)
	{
		super(X, Y, MaxSize);
		_base = new FlxSprite(x, y, null);
		_base.makeGraphic(96, 96, 0x5500FF90);
		_base.origin = new FlxPoint();
		
		alpha = 0.5;
		add(_base);
		_power = false;
		
		_powerIcon = new FlxSprite(x, y, AssetPaths.power__png);
		_powerIcon.origin = new FlxPoint();
		add(_powerIcon);
		this.solid = false;
		this.moves = false;
		
	}
	
	public function isPowered() :Bool { return _power; }
	public function setPowered(value :Bool) 
	{ 
		_power = value; 
		if(_building != null)
		{
			if(_building.requiresPower())
			{
				_building.powered = value;
			}
		}
	}

	public function getBuilding() :Building { return _building;}
	
	public function get_forceCheck() :Bool { return _forceCheck;}
	
	public function set_forceCheck(value)
	{
		_forceCheck = value;
		
		return _forceCheck;
	}
	
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
		
		
		if (_building != null)
		{
			return;
		}
		_building = b;
		add(b);
		b.origin = new FlxPoint();
 		if(this.isPowered())
		{
			b.powered = true;

		}
		
		if (b.name == "Power Plant")
		{
			b.powered = true;
		}
		
		_forceCheck = true;
	}

	
	override public function update():Void
    {
		super.update();
	
		if (!this.alive)
			return;
      
		if (FlxG.mouse.justPressed)
		{
			var p :FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(x, y, width * scale.x, height * scale.y);
			
			if (r == null)
			{
				trace("r IS SHIT");
			}
			
			if (p.inFlxRect(r))
			{
				
				if(CompostG.FUNC_BUTTON != "Erase")
				{
					addBuilding(BuildingFactory.instance().createBuildingInstance());
				}
				else
				{
					if (_building != null && _building.alive)
					{
						_building.kill();
						_building.alive = false;
						
						_building = null; 
						_forceCheck = true;
						return;
					}
				}
			}
		}

		for (i in 0 ... members.length)
		{
			if (members[i] != null && members[i].alive)
			{
				members[i].x = x;
				members[i].y = y;
				members[i].scale = scale;
				members[i].alpha = alpha;
			}
		}

		if(_power)
		{
			alpha = 1;
		
 			if(_building != null)
			{
				if(_building.requiresPower())
				{
					_building.powered = (true);
				}
			}
			_powerIcon.visible = false;
		}
		else
		{
			
			alpha = 0.5;
			if(_building != null && _building.alive)
			{
				if(_building.requiresPower())
				{
					_building.powered = (false)	;
				}
			}
			_powerIcon.visible = true;
		}

    }

    override public function destroy():Void
    {
        super.destroy();
    }
	
	
}