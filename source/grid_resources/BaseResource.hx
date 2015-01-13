package grid_resources;

import openfl.utils.Object;
import flixel.FlxSprite;

/**
 * ...
 * @author Gerardo Heidel
 */
class BaseResource extends FlxSprite
{
	private var _productionType :String = "";
	private var _maxAmout : Int = 0;
	private var _name :String = "";
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, ?SimpleGraphic);
	}
	
	public function loadData(data :Object) :Void
	{
		_productionType 	= data.productionType;
		_maxAmout 			= data.maxAmount;
		_name				= data.name;
	}
}