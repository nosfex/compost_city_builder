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
	var _confirmScrollTimer :Float = 0;
	var _maxConfirmScrollTimer :Float = 1.5;
	
	@:isVar public var minLimitX(default, default) :Float = 0.15;
	@:isVar public var minLimitY(default, default) :Float = 0.15;
	@:isVar public var maxLimitX(default, default) :Float = 0.85;
	@:isVar public var maxLimitY(default, default) :Float = 0.85;
	
	
	public function new(X:Float=0, Y:Float=0, Width:Float=0, Height:Float=0) 
	{
		super(X, Y, Width, Height);
	}
	
	override public function update() :Void
	{
		super.update();
		
		if (FlxG.mouse.screenX <= FlxG.width * minLimitX)
		{
			moveCam(true, -_camControlSpeed);
		}
		
		if (FlxG.mouse.screenX >= FlxG.width * maxLimitX )
		{
			moveCam(true, _camControlSpeed);
		}
		
		if (FlxG.mouse.screenY <= FlxG.height * minLimitY)
		{
			moveCam(false, -_camControlSpeed);
		}
		
		if (FlxG.mouse.screenY >= FlxG.height * maxLimitY) 
		{
			moveCam(false, _camControlSpeed);
		}
		
		
		if (FlxG.mouse.screenX >= minLimitX  && FlxG.mouse.screenX <= maxLimitX)
		{
			_confirmScrollTimer = 0;
		}
		
		if (FlxG.mouse.screenY >= minLimitY && FlxG.mouse.screenY <= minLimitY)
		{
			_confirmScrollTimer = 0;
		}
		
		// GH: This is bullshit
		if (FlxG.mouse.wheel > 0)
		{
			FlxG.camera.zoom -= FlxG.mouse.wheel * FlxG.elapsed;
		}
		
	}
	// GH: Cleanup, check this doesn't break anything
	function moveCam(x :Bool, speed: Float) : Void
	{
		_confirmScrollTimer += FlxG.elapsed;
		if (_confirmScrollTimer > _maxConfirmScrollTimer)
		{
			if (x) this.x += speed * FlxG.elapsed;
			else this.y += speed * FlxG.elapsed;
		}
	}
	
}