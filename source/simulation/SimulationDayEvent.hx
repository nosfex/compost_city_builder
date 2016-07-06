package simulation;

import openfl.events.Event;

/**
 * ...
 * @author Gerardo Heidel
 */
class SimulationDayEvent extends Event
{

	public static var DAY_OVER :String = "day_over";
	public static var MONTH_OVER :String = "month_over";
	public static var YEAR_OVER :String = "year_over";
	public function new(type:String, bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(type, bubbles, cancelable);
		
	}
	
}