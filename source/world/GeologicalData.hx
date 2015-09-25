package world;

/**
 * ...
 * @author Gerardo Heidel
 */
class GeologicalData
{

	@:isVar public var metalDensity(default, default) :Float = 0;
	@:isVar public var rockFormation(default, default) :Float = 0;
	
	public function new() 
	{
		
	}
	
	public function toString() :String
	{
		return "metalDensity: " + metalDensity + " rockFormation: " + rockFormation;	
	}

	
}