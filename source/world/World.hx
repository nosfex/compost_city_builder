package world;

import flixel.group.FlxSpriteGroup;

/**
 * ...
 * @author ...
 */
class World extends FlxSpriteGroup
{

	
	static public var SUMMER :String = "SUMMER";
	static public var WINTER :String = "WINTER";
	static public var AUTUMN :String = "AUTUMN";
	static public var SPRING :String = "SPRING";
	
	@:isVar public var currentCycle(default, default) : String = World.SUMMER;
	
	public function new(X:Float=0, Y:Float=0, MaxSize:Int=0) 
	{
		super(X, Y, MaxSize);
	}
	
	override public function update()
	{
		
	}
	
}