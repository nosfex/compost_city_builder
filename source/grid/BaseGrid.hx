package grid;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.FlxG;
import buildings.Building;
import buildings.BuildingFactory;
import flixel.math.FlxRect;
/**
 * ...
 * @author Gerardo Heidel
 */
class BaseGrid extends FlxSpriteGroup
{
	
	// GH: Arbitrary ids
	static public var NORMAL_GRID 	:Int = 0x10;
	static public var WATER_GRID	:Int = 0x20;
	static public var MINERAL_GRID	:Int = 0x30;
	static public var NULL_GRID		:Int = 0x90;
	
	// GH: Type properties 
	@:isVar public var type(default, set) : Int = 0x00;
	// GH: Selected prop, lights up tile
	@:isVar public var selected(default, default) :Bool = false;
	
	@:isVar public var categoryFilter(default, default) : Array<String> = null;  
	@:isVar public var buildingFilter(default, default) : Array<String> = null;
	@:isVar public var powerable(default, default) : Bool = true;

	// GH: Type Setter, we change tyle graphics
	function set_type(newType :Int)
	{
		switch(newType)
		{
			// GH: Normal tile
			case 0x10:
				return type = newType;
			// GH: Water tile
			case 0x20:
				_typeIcon.loadGraphic(AssetPaths.water_tile__png);
			// GH: Mineral tile
			case 0x30:
				_typeIcon.loadGraphic(AssetPaths.mineral_tile__png);
				
		}
		return type = newType;
	}
	
	public var usable(get, set) : Bool;
	public var forceCheck(get, set) : Bool;
	
	private var _usable :Bool = false;
	
	private var _building :Building = null;
	private var _base :FlxSprite;
	
	private var _power :Bool;
		
	private var _forceCheck : Bool = false;
	private var _typeIcon :FlxSprite = null;
	private var _dirtyGraphic : Bool = false;
	
	public function new(X:Float = 0, Y:Float = 0, MaxSize:Int = 0)
	{
		super(X, Y, MaxSize);
		
		// GH: Generate the holder
		_base = new FlxSprite(x, y, null);
		_base.makeGraphic(96, 96, 0x5500FF90);
		_base.origin = new FlxPoint();
		_base.useColorTransform = true;
		alpha = 0.5;
		add(_base);
		// GH: start unpowered
		_power = false;
		
		// GH: Icon for the tile (represents water / empty / mineral)
		_typeIcon = new FlxSprite(x, y, AssetPaths.power__png);
		_typeIcon.origin = new FlxPoint();
		add(_typeIcon);
		// GH: Stupid flixel physics
		this.solid = false;
		this.moves = false;
	}
	
	public function isPowered() :Bool { return _power; }
	// GH: Force powering of the tile + building
	public function setPowered(value :Bool) 
	{ 
		// GH: Some times you can't power them
		if (powerable)
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

	
	override public function update(elapsed: Float):Void
    {
		super.update(elapsed);
	  
		if (FlxG.mouse.justPressed)
		{
			var p :FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
			var r :FlxRect = new FlxRect(x, y, width * scale.x, height * scale.y);
			
			if (r == null)
			{
				trace("r IS SHIT");
			}
			
			if (p.inRect(r))
			{
				
				selected = true;
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
			//alpha = 1;
			_dirtyGraphic = true;
			_base.makeGraphic(96, 96 , 0x550000FF);
			
			if(_building != null)
			{
				if(_building.requiresPower())
				{
					_building.powered = (true);
				}
			}
			if (this.type == NORMAL_GRID)
			{
				_typeIcon.visible = false;
			}
		}
		else
		{
			alpha = 0.5;
			if (_dirtyGraphic)
			{
				_base.makeGraphic(96, 96, 0x5500FF90);
				_dirtyGraphic = false;
			}
			if(_building != null && _building.alive)
			{
				if(_building.requiresPower())
				{
					_building.powered = (false)	;
				}
			}
			_typeIcon.visible = true;
		}
			
		if (selected)
		{
			alpha = 1;
		}
		else alpha = 0.5;
			
    }
	
    override public function destroy():Void
    {
        super.destroy();
    }
	
	public function removeBuilding() :Void
	{
		// GH: we need to reset the tile completely
		setPowered(false);
		forceCheck = true; // GH: Force checks to enable the gridMap status check for tiles
		remove(_building, true);
		_building = null;
	}
	
	public function processFunction(funcName : String): Void
	{
		switch(funcName)
		{
			case "Scrap":
				_building.processFunction(funcName);
				removeBuilding();
				CompostG.UI_SELECTOR.clearSelection();
				CompostG.FUNC_BUTTON = "";
			case "Add Grids":
				_building.processFunction(funcName);
				CompostG.FUNC_BUTTON = "";
		}
		
	}
	
}