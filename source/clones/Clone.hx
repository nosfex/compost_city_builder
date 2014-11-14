package clones;

import buildings.Building;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import production.Product;

/**
 * ...
 * @author Gerardo Heidel
 */
class Clone extends Product
{
	private var _speed :FlxPoint = new FlxPoint(5, 0);
	
	private static var _maxSpeed :Int = 20;
	
	private var _orders :Array<Int> = new Array();
	private var _maxWalk : FlxPoint = new FlxPoint(96, 96);
	
	private static var CLONE_UP : FlxPoint = new FlxPoint(0, - _maxSpeed);
	private static var CLONE_DOWN : FlxPoint = new FlxPoint(0, _maxSpeed);
	private static var CLONE_LEFT : FlxPoint = new FlxPoint(-_maxSpeed, 0);
	private static var CLONE_RIGHT : FlxPoint = new FlxPoint(_maxSpeed, 0);
	
	public static var UP_DIR_CLONE : Int = 0;
	public static var DOWN_DIR_CLONE : Int = 1;
	public static var LEFT_DIR_CLONE : Int = 2;
	public static var RIGHT_DIR_CLONE : Int = 3;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		_orders.push(0);
		_orders.push(1);
		_orders.push(2);
		_orders.push(3);
		changeDirection(); 
	}
	
	

	public override function update() :Void
	{
		super.update();
		
		// GH: Force it to live within the confines of the area
		while (!_flxColRect.containsFlxPoint(new FlxPoint(this.x + _speed.x * FlxG.elapsed, this.y + _speed.y * FlxG.elapsed )))
		{
			// GH: Change direction;
			changeDirection();
		}
		

		if (_maxWalk.x <= 0 || _maxWalk.y <= 0)
		{
			changeDirection();
			_maxWalk = new FlxPoint(96, 96);
		}

		
		this.x += _speed.x * FlxG.elapsed;
		this.y += _speed.y * FlxG.elapsed;

		_maxWalk.x -= Math.abs(_speed.x *FlxG.elapsed);
		_maxWalk.y -= Math.abs(_speed.y *FlxG.elapsed);
	}
	
	private function processDirection(dir : Int) :Void
	{
		switch(dir)
		{
			case 0:
				_speed = CLONE_UP;
			case 1:
				_speed = CLONE_DOWN;
			case 2:
				_speed = CLONE_LEFT;
			case 3:
				_speed = CLONE_RIGHT;
		};
	}
	
	
	
	public function changeDirection() :Void
	{	
		processDirection(takeRandom());
	}
	
	
	private function takeRandom() :Int
	{
		var direction :Int = Math.floor(Math.random() * _orders.length);
		
		var r :Int = _orders[direction];
		_orders.splice(direction, 1);
		
		if (_orders.length == 0)
		{
			_orders.push(0);
			_orders.push(1);
			_orders.push(2);
			_orders.push(3);
		}
		return r;
	}
	
}