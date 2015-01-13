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
	
	private static var _blockSize :Int = 96;
	private var _orders :Array<Int> = new Array();
	private var _maxWalk : FlxPoint = new FlxPoint(_blockSize, _blockSize);
	
	private static var CLONE_UP : FlxPoint = new FlxPoint(0, - _maxSpeed);
	private static var CLONE_DOWN : FlxPoint = new FlxPoint(0, _maxSpeed);
	private static var CLONE_LEFT : FlxPoint = new FlxPoint(-_maxSpeed, 0);
	private static var CLONE_RIGHT : FlxPoint = new FlxPoint(_maxSpeed, 0);
	
	public static var UP_DIR_CLONE : Int = 0;
	public static var DOWN_DIR_CLONE : Int = 1;
	public static var LEFT_DIR_CLONE : Int = 2;
	public static var RIGHT_DIR_CLONE : Int = 3;
	private var _forcedOrders:Array<FlxPoint> = new Array();
	private var _finishedForcedOrders :Bool = false;
	
	public var finishedForcedOrders(get, set) : Bool;
	
	public function get_finishedForcedOrders() :Bool { return _finishedForcedOrders; }
	public function set_finishedForcedOrders(value : Bool) :Bool { _finishedForcedOrders = value; return _finishedForcedOrders; }
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		_orders.push(0);
		_orders.push(1);
		_orders.push(2);
		_orders.push(3);
		changeDirection(); 
		
		_gotoPos = null;
	}
	
	public override function use(fromBuilding :Building) :Void
	{
		super.use(fromBuilding);
		_gotoPos = new FlxPoint(fromBuilding.x, fromBuilding.y);
		
	}

	public override function update() :Void
	{
		super.update();
		
		if (_gotoPos != null && _forcedOrders.length == 0)
		{
			var p : FlxPoint = new FlxPoint(x, y);
			if (p.distanceTo(_gotoPos) <= 5.0)
			{
				//this.kill();
				//_gotoPos = null;
				
				return;
			}
			
			processGotoPoint();
			return;
		}
		// GH FIX THIS BUGGED OUT
		// GH: Force it to live within the confines of the area
		while (!_flxColRect.containsFlxPoint(new FlxPoint(this.x + _speed.x * FlxG.elapsed, this.y + _speed.y * FlxG.elapsed )))
		{
			// GH: Change direction;
			changeDirection();
		}

		if (_maxWalk.x <= 0 || _maxWalk.y <= 0)
		{
			if(_forcedOrders.length != 0)
			{
				_speed = takeRandomFromForcedOrder();
				if(_forcedOrders.length == 0)
				{
					_finishedForcedOrders = true;
					_useFromBuilding.addWorker(this);
				}
				
			}
			else if(_finishedForcedOrders == false) 
			{
				changeDirection();
			}
			_maxWalk = new FlxPoint(_blockSize, _blockSize);
		}
		
		this.x += _speed.x * FlxG.elapsed;
		this.y += _speed.y * FlxG.elapsed;

		_maxWalk.x -= Math.abs(_speed.x * FlxG.elapsed);
		_maxWalk.y -= Math.abs(_speed.y * FlxG.elapsed);
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
	
	
	public function processGotoPoint(): Void
	{
		var distanceX :Float = _gotoPos.x - this.x;
		var distanceY :Float = _gotoPos.y - this.y;
		var stepsX : Float = Math.ceil(distanceX / _blockSize);
		var stepsY : Float = Math.ceil(distanceY / _blockSize);
		// GH: Means user is going left
		
		var vert :FlxPoint = CLONE_DOWN;
		var horz :FlxPoint = CLONE_RIGHT;
		if (stepsX <  0)
		{
			stepsX = Math.abs(stepsX);
			horz = CLONE_LEFT;
		}
	
		if (stepsY < 0)
		{
			stepsY = Math.abs(stepsY);
			vert = CLONE_UP;
		}
			
		for (i in 0 ... cast(stepsX))
		{
			_forcedOrders.push(horz);
		}
	
		for (i in 0 ... cast(stepsY))
		{
			_forcedOrders.push(vert);
		}
	


		
	}
	
	public function changeDirection() :Void
	{	
		processDirection(takeRandom());
	}
	
	
	private function takeRandomFromForcedOrder() : FlxPoint
	{
		var order :Int = Math.floor(Math.random() * _forcedOrders.length);
		var r :FlxPoint = _forcedOrders[order];
		_forcedOrders.splice(order, 1);
		trace("TAKING SOME SHIET BRUH");
		return r;
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