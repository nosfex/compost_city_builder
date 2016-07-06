package tasks;
import CompostG;

/**
 * ...
 * @author Gerardo Heidel
 */
class Task
{
	
	static public var GATHER_RESOURCE 	: String = "gather";
	static public var BUILD_IMPROVEMENT : String = "build";
	static public var TAXES_TASK		: String = "taxes";
	
	@:isVar public var timed(default, default) : Bool = false;
	@:isVar public var type(default, default) : String = 0;
	@:isVar public var goal(default, default) : Int = 0;
	@:isVar public var currentGoal(default, default) : Int = 0;
	@:isVar public var description(default, default) : String = ""; 
	@:isVar public var target(default, default) : String = "";
	@:isVar public var active(default, default) : Bool = false;
	@:isVar public var reward(default, default) : String = "";
	@:isVar public var rewardAmount(default, default) : Int = 0;
	
	public function new() 
	{
		
	}
	
	public function init(data : TaskData) : Void
	{
		timed = data.timed;
		type = data.type;
		goal = data.goal;
		description = data.description;
		target = data.target;
	}
	
	public function onTaskCheck() :Void
	{
		currentGoal++;
		
		if (currentGoal >= goal)
		{
			// GH: Task finished, give reward
			CompostG.cashReward(reward, rewardAmount);
		}
	}
}