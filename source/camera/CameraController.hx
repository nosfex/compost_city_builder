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
	
	public function new(X:Float=0, Y:Float=0, Width:Float=0, Height:Float=0) 
	{
		super(X, Y, Width, Height);
	}
	
	override public function update() :Void
	{
		super.update();
		
		if (FlxG.mouse.screenX <= FlxG.width * 0.15)
		{
			_confirmScrollTimer += FlxG.elapsed;
			if (_confirmScrollTimer > _maxConfirmScrollTimer)
			{
				this.x -= _camControlSpeed * FlxG.elapsed;
			}
		}
		
		if (FlxG.mouse.screenX >= FlxG.width * 0.6 && FlxG.mouse.screenX <= FlxG.width * 0.75 )
		{
			_confirmScrollTimer += FlxG.elapsed;
			if (_confirmScrollTimer > _maxConfirmScrollTimer)
			{
				this.x += _camControlSpeed * FlxG.elapsed;
			}
		}
		
		if (FlxG.mouse.screenY <= FlxG.height * 0.15)
		{
			_confirmScrollTimer += FlxG.elapsed;
			if (_confirmScrollTimer > _maxConfirmScrollTimer)
			{
				this.y -= _camControlSpeed * FlxG.elapsed;
			}
		}
		
		if (FlxG.mouse.screenY >= FlxG.height * 0.85) 
		{
			_confirmScrollTimer += FlxG.elapsed;
			if (_confirmScrollTimer > _maxConfirmScrollTimer)
			{
				this.y += _camControlSpeed * FlxG.elapsed;
			}
		}
		
		
		if (FlxG.mouse.screenX >= .15  && FlxG.mouse.screenX <= .6)
		{
			_confirmScrollTimer = 0;
		}
		
		if (FlxG.mouse.screenY >= .15 && FlxG.mouse.screenY <= .85)
		{
			_confirmScrollTimer = 0;
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