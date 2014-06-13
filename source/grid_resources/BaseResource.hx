package grid_resources;

import flixel.FlxSprite;

/**
 * ...
 * @author Gerardo Heidel
 */
class BaseResource extends FlxSprite
{
	private var productionCooldown :Float  = 0;
	private var productionType :String = "";
	private var reachType :Int;
	private var productionOutput : Int = 0;

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, ?SimpleGraphic);
		
	}
	
}