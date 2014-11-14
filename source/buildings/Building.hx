package buildings;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Json;
import flixel.FlxG;
import openfl.utils.Object;
import production.ProductionFactory;
import production.Product;

/**
 * ...
 * @author Gerardo Heidel
 */
class Building extends FlxSprite
{
	
	public var name(get, set) :String;
	public var powered(get, set): Bool;
	
	private var _requiresPower: Bool = false;
	private var _influenceArea :String = "N4";
	private var _initialTechLevel :Int = 0;
	private var _currTechLevel : Int = 0;
	private var _productionType :String = "";
	private var _productionRate :Float = 0.0;
	private var _production :Int = 0;
	private var _productionTimer :Float = 0;
	private var _maxProduction :Int = 0;
	private var _name :String = "";
	private var _power :Bool = false;
	private var _holdTile :Bool = true;
	
	private var _productionObject :Array <Product> = new Array();
	private var _buildingMaxDmg : Int = 0;
	
	// GH: ------------------ GET / SET ---------------------	
	public function get_name() :String { return _name;  }
	public function set_name(value) { _name = value; return _name; }
	
	public function get_powered() :Bool { return _power; }
	public function set_powered(value :Bool) { _power = value; return _power; }

	public function requiresPower() :Bool { return _requiresPower; }

	public function getInfluenceArea() :String { return _influenceArea; }	
	public function getProductionType() :String { return _productionType; }
	public function getProduction() : Int { return _production; }
	public function getProductionRate() :Float { return _productionRate; }

	//public function getProductionObject
	
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
		_maxProduction	= data.maxProduction;
	}
	
	
	override public function update() :Void
	{
	
		super.update();
		if (this.alive)
		{
			if (_power || !_requiresPower)
			{
				if (_productionTimer >= _productionRate )
				{
					
					if (_production <= _maxProduction)
					{
						_production++;
						_productionTimer = 0;
						var p :Product = ProductionFactory.instance().buildProduct(_productionType, new FlxPoint(x - 18, y - 18), this);
						if (p != null)
						{
							_productionObject.push(p);
							CompostG.GRID_MAP.addProduct(p);
							p.prodParent = this;
						}
					}
				}
				
				_productionTimer += FlxG.elapsed;
			}
			// GH: Requires power and doesn't have any
			else
			{
				// GH: Generate an icon for this, or better yet, a callback to flash an icon
				trace("NO POWER - REQUIRES POWER");
			}
			
			if (_buildingMaxDmg <= 0)
			{
				this.kill();
			}
		}
	}
	
}