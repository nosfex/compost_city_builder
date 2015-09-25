package world;

/**
 * ...
 * @author Gerardo Heidel
 */
class AnimalData
{

	@:isVar public var agressiveness(default, default) : Float = 0; /// GH: Chance to attack the settlement
	@:isVar public var populationSize(default, default) : Float = 0; // GH: How many of them are there
	@:isVar public var evolutionaryStage(default, default) :Float = 0; // GH: 0 
	@:isVar public var atemporality(default, default) :Float = 0;
	public function new() 
	{
		
	}
	
	public function toString() :String
	{
		return "agressiveness: " + agressiveness + " populationSize: " + populationSize + " evolutionaryStage: " + evolutionaryStage + " atemporality: " + atemporality ;	
	}
	
}