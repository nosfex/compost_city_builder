package buildings;

import flixel.FlxSprite;
import haxe.Json;
import flixel.FlxG;

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
	private var _powered :Bool = false;
	private var _holdTile :Bool = true;
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, ?SimpleGraphic);	
	}
	
	public function load(data : Json) :Void
	{
		_requiresPower 	= data.power;
		_influenceArea 	= data.area;
		_currTechLevel 	= _initialTechLevel = data.techLevel;
		_productionType	= data.productionType;
		_productionRate = data.productionRate;
		_name 			= data.name;
		
		_holdTile 		= data.holdTile;
	}
	
	
	override public function update() :Void
	{
		super.update();
		
		if ((_requiresPower && _powered) || !_requiresPower)
		{
			if (_productionTimer >= 1)
			{
				_production ++;
				_productionTimer = 0.0;
			}
			_productionTimer += FlxG.elapsed * _productionRate;
		}
		// GH: Requires power and doesn't have any
		else
		{
			
		}
	}
}