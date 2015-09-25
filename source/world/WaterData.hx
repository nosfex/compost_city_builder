package world;

/**
 * @author null
 * null
 * null
 */
class WaterData
{
	@:isVar public var coverage(default, default) :Float = 0;  // GH: 0 no coverage - 1 full
	@:isVar public var clean(default, default) :Float = 0; // GH: Range, 0 dirty, 1 _clean
	
	public function new() 
	{
	}	
	
	public function toString() :String
	{
		return "coverage: " + coverage + " clean: " + clean;	
	}
}