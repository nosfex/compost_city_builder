package world;

/**
 * ...
 * @author Gerardo Heidel
 */
class AtmosphereData
{
	@:isVar public var breathable(default, default) : Float = 0; // GH: Range 0 - 1. How hard is it to breathe in here?
	@:isVar public var gravitySupport(default, default) :Float = 0; // GH: Range, how close it comes, in addition to the rock formation to support gravity
	
	public function new() 
	{
		
	}
	
	public function toString() :String
	{
		return "breathable: " + breathable + " gravitySupport: " + gravitySupport;	
	}

	
}