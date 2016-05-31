package simulation; 

import flixel.FlxG;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Gerardo Heidel
 */
class SimulationController
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
	
	public function new() 
	{
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
	}
	
	private function checkIncreaseHour() :Void
	{
		if (currentHour >= dayDuration)
		{
			currentDay++;
			currentHour = 0;
		}
	}
	
	private function checkIncreaseDay() : Void
	{
		if (currentDay >= monthDuration)
		{
			currentMonth++;
			currentDay = 0;
		}
	}
	
	private function checkIncreaseMonth() :Void
	{
		if (currentMonth >= yearDuration)
		{
			currentYear++;
			currentMonth = 0;
		}
	}
	
		
	public function update() :Void
	{
		
	}
	
}