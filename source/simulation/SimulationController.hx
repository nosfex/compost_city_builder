package simulation; 

import flixel.FlxG;
import flixel.util.FlxTimer;
import openfl.events.EventDispatcher;
import openfl.events.Event;
import openfl.events.IEventDispatcher;

/**
 * ...
 * @author Gerardo Heidel
 */
class SimulationController implements IEventDispatcher
{
	
	// GH: Made up duration
	@:isVar public var hourDuration(default, null) : Int = 100;
	
	@:isVar public var dayDuration(default, null) : Int = 24;
	//GH: How much time does it take to advance a month?
	@:isVar public var monthDuration(default, null) :Int = 30;
	
	@:isVar public var yearDuration(default, null) : Int = 12;
	
	public var _ticker :FlxTimer = null;
	
	@:isVar public var currentHour :Int = 0;
	@:isVar public var currentDay  :Int = 1;
	@:isVar public var currentMonth :Int = 1;
	@:isVar public var currentYear :Int = 1975;
	
	private var _dispatcher :EventDispatcher;
	
	
	
	public function new() 
	{
		_dispatcher = new EventDispatcher(this);
		
		init();
	}
	
	private function init() :Void
	{
		_ticker = new FlxTimer();
		_ticker.start(0.1, advanceTime, 0);
	}
	
	private function advanceTime(timer :FlxTimer) :Void
	{
		currentHour++;
		checkIncreaseHour();
		checkIncreaseDay();
		checkIncreaseMonth();
	}
	
	private function checkIncreaseHour() :Void
	{
		if (currentHour >= dayDuration)
		{
			currentDay++;
			currentHour = 0;
			// GH: Fire a widespread event
			FlxG.log.add("FIRING + : " + SimulationDayEvent.DAY_OVER + " WILLtRIGGER?: " + willTrigger(SimulationDayEvent.DAY_OVER)) ;
			_dispatcher.dispatchEvent(new SimulationDayEvent(SimulationDayEvent.DAY_OVER));
		}
	}
	
	private function checkIncreaseDay() : Void
	{
		if (currentDay >= monthDuration)
		{
			currentMonth++;
			currentDay = 0;
			_dispatcher.dispatchEvent(new SimulationDayEvent(SimulationDayEvent.MONTH_OVER));
		}
	}
	
	private function checkIncreaseMonth() :Void
	{
		if (currentMonth >= yearDuration)
		{
			currentYear++;
			currentMonth = 0;
			_dispatcher.dispatchEvent(new SimulationDayEvent(SimulationDayEvent.YEAR_OVER));
		}
	}
	
		
	public function update() :Void
	{
		
	}
	
	// GH: IEventDispatcher implementation
	public function addEventListener (type:String, listener:Dynamic->Void, useCapture:Bool = false, priority:Int = 0, useWeakReference:Bool = false):Void
	{
		_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}
	public function dispatchEvent (event:Event):Bool
	{
		return _dispatcher.dispatchEvent(event);
	}
	public function hasEventListener (type:String):Bool
	{
		return _dispatcher.hasEventListener(type);
	}
	public function removeEventListener (type:String, listener:Dynamic->Void, useCapture:Bool = false):Void
	{
		_dispatcher.removeEventListener(type, listener, useCapture);
	}
	public function willTrigger (type:String):Bool
	{
		return _dispatcher.willTrigger(type);
	}
	
}