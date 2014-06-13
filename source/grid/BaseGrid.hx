package grid;

import flixel.FlxSprite;

/**
 * ...
 * @author Gerardo Heidel
 */
class BaseGrid extends FlxSprite
{

	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(96, 96, 0x5500FF90);
		
	}
	
	public function setData(value :GridData) :Void
	{
		
	}
	
	override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
	
	
}