package world;

/**
 * ...
 * @author Gerardo Heidel
 */
class TemperatureData
{

	@:isVar public var heat(default, default) : Float = 0;
	
	public function new() 
	{
		
	}
	
	public function toString() :String
	{
		return "heat: " + heat;	
	}

	
}