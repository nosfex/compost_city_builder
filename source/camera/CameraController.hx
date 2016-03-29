package camera;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.input.keyboard.FlxKeyList;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
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
	@:isVar public var minLimitY(default, default) :Float = 0.25;
	@:isVar public var maxLimitX(default, default) :Float = 0.85;
	@:isVar public var maxLimitY(default, default) :Float = 0.65;
	
	
	public function new(X:Float=0, Y:Float=0, Width:Float=0, Height:Float=0) 
	{
		super(X, Y, Width, Height);
	}
	
	override public function update(elapsed :Float) :Void
	{
		super.update(elapsed);
		
	
		if (CompostG.UI_SELECTOR.selectorLocked)
		{
			return;
		}
		
		if (FlxG.mouse.screenX <= FlxG.width * minLimitX)
		{
			moveCam(elapsed, true, -_camControlSpeed);
		}
		
		if (FlxG.mouse.screenX >= FlxG.width * maxLimitX )
		{
			moveCam(elapsed, true, _camControlSpeed);
		}
		
		if (FlxG.mouse.screenY <= FlxG.height * minLimitY)
		{
			moveCam(elapsed, false, -_camControlSpeed);
		}
		
		else if (FlxG.mouse.screenY >= FlxG.height * maxLimitY) 
		{
			moveCam(elapsed, false, _camControlSpeed);
		}
		
		if (FlxG.mouse.screenX >= minLimitX  && FlxG.mouse.screenX <= maxLimitX)
		{
			_confirmScrollTimer = 0;
		}
			
		// GH: This is bullshit
		if (FlxG.mouse.wheel > 0)
		{
			FlxG.camera.zoom -= FlxG.mouse.wheel * elapsed;
		}
	}
	
	public function moveToPos(pos : FlxPoint) : Void
	{
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(this, { x:pos.x - FlxG.width / 2, y:pos.y - FlxG.height / 2 }, 0.31, options);
	}
	
	// GH: Cleanup, check this doesn't break anything
	function moveCam(elapsed: Float, x :Bool, speed: Float) : Void
	{
		_confirmScrollTimer += elapsed;
		if (_confirmScrollTimer > _maxConfirmScrollTimer)
		{
			if (x) this.x += speed * elapsed;
			else this.y += speed * elapsed;
		}
	}
	
}