package camera;

import flixel.FlxObject;
import flixel.FlxG;
import flixel.input.keyboard.FlxKeyList;
import flixel.input.keyboard.FlxKey;
/**
 * ...
 * @author Gerardo Heidel
 */
class CameraController extends FlxObject
{
	static private inline var _camControlSpeed:Int = 150;
	
	public function new(X:Float=0, Y:Float=0, Width:Float=0, Height:Float=0) 
	{
		super(X, Y, Width, Height);
	}
	
	override public function update() :Void
	{
		super.update();
		
		if (FlxG.mouse.screenX < FlxG.width * 0.05)
		{
			this.x -= _camControlSpeed * FlxG.elapsed;
		}
		
		if (FlxG.mouse.screenX > FlxG.width * 0.95) 
		{
			this.x += _camControlSpeed * FlxG.elapsed;
		}
		
		if (FlxG.mouse.screenY < FlxG.height * 0.05)
		{
			this.y -= _camControlSpeed * FlxG.elapsed;
		}
		
		if (FlxG.mouse.screenY > FlxG.height * 0.95) 
		{
			this.y += _camControlSpeed * FlxG.elapsed;
		}
		
		
		
		if (FlxG.mouse.wheel > 0)
		{
			FlxG.camera.zoom -= FlxG.mouse.wheel * FlxG.elapsed;
		}
		
		// GH: Key controls
		if (FlxG.keys.checkStatus(FlxKey.U, FlxKey.PRESSED))
		{
			this.y -= _camControlSpeed * FlxG.elapsed;
			FlxG.log.add("UP");
		}
		
		if (FlxG.keys.checkStatus(FlxKey.J, FlxKey.PRESSED))
		{
			this.y += _camControlSpeed * FlxG.elapsed;
		}
		
		if (FlxG.keys.checkStatus(FlxKey.H, FlxKey.PRESSED))
		{
			this.x -= _camControlSpeed * FlxG.elapsed;
		}
		
		if (FlxG.keys.checkStatus(FlxKey.K, FlxKey.PRESSED))
		{
			this.x += _camControlSpeed * FlxG.elapsed;
		}
	}
	
}