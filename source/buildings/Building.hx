package buildings;

import flixel.FlxSprite;
import haxe.Json;
import flixel.FlxG;
import openfl.utils.Object;

/**
 * ...
 * @author Gerardo Heidel
 */
class Building extends FlxSprite
{
	

	
	private var _requiresPower: Bool = false;
	private var _influenceArea :String = "N4";
	private var _initialTechLevel :Int = 0;
	private var _currTechLevel : Int = 0;
	private var _productionType :String = "";
	private var _productionRate :Float = 0.0;
	private var _production :Int = 0;
	private var _productionTimer :Float = 0;
	private var _name :String = "";
	private var _power :Bool = false;
	private var _holdTile :Bool = true;
	
	private var _buildingMaxDmg : Int = 0;
	
	// GH: ------------------ GET / SET ---------------------	
	public function isPowered() :Bool { return _power; }
	public function setPowered(value :Bool) { _power = value; }

	public function requiresPower() :Bool { return _requiresPower; }

	public function getInfluenceArea() :String { return _influenceArea; }	
	public function getProductionType() :String { return _productionType; }
	public function getProduction() : Int { return _production; }
	public function getProductionRate() :Float { return _productionRate; }
//	public var influenceArea(get, set) :String;
//	public function get_influenceArea() :String { return _influenceArea; }
//	public function set_influenceArea(value: String)  { _influenceArea = value; }
	
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);	
	}
	
	public function load(data : Object) :Void
	{
		_requiresPower 	= data.requiresPower;
		_influenceArea 	= data.area;
		_currTechLevel 	= _initialTechLevel = data.techLevel;
		_productionType	= data.productionType;
		_productionRate = data.productionRate;
		_name 			= data.name;
		_holdTile 		= data.holdTile;
		_buildingMaxDmg = data.buildingMaxDmg;
		
		
	}
	
	
	override public function update() :Void
	{
	
		super.update();
		if (this.alive)
		{
			
 			if (_power || !_requiresPower)
			{
				if (_productionTimer >= 1)
				{
					_production++;
					_productionTimer = 0.0;
				}
				_productionTimer += FlxG.elapsed * _productionRate;
				
				
			}
			// GH: Requires power and doesn't have any
			else
			{
				// GH: Generate an icon for this, or better yet, a callback to flash an icon
			}
			
			if (_buildingMaxDmg <= 0)
			{
				this.kill();
			}
			
			
		}
	}
	
}