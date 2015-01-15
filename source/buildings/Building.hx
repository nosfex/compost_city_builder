package buildings;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Json;
import flixel.FlxG;
import openfl.utils.Object;
import production.ProductionFactory;
import production.Product;
import clones.Clone;
class Building extends FlxSprite
{
    public var name(get, set):String;
    public var powered(get, set):Bool;
    public var productionObject(get, set):Array<Product>;
	public var upkeepCost(get, set) : Int;
    var _requiresPower:Bool = false;
    var _requiresManPower:Bool = false;
    var _maxManPower:Int = 0;
    var _influenceArea:String = "N4";
    var _initialTechLevel:Int = 0;
    var _currTechLevel:Int = 0;
    var _productionType:String = "";
    var _productionRate:Float = 0.0;
    var _production:Int = 0;
    var _productionTimer:Float = 0;
    var _maxProduction:Int = 0;
    var _name:String = "";
    var _power:Bool = false;
    var _holdTile:Bool = true;
    var _price:Int = 0;
    var _productionObject:Array<Product> = new Array();
    var _buildingMaxDmg:Int = 2;
    var _currentManPower:Int = 0;
	var _requestedManPower :Int = 0;
    var _manPowerEnablerTimer:Float = 0;
    var _manPowerMaxPower:Float = 2;
	var _workers :Array<Clone> = new Array();
	

	var _upkeepCost :Int = 0; 
	
	public function get_upkeepCost() :Int									{ return _upkeepCost; }
	public function set_upkeepCost(value : Int) :Int						{ _upkeepCost = value; return _upkeepCost; }
	
    public function get_name():String    									{ return _name; }
    public function set_name(value) 										{ _name = value; return _name; }

    public function get_powered():Bool    									{ return _power; }
    public function set_powered(value:Bool) 								{ _power = value; return _power; }

    public function get_productionObject():Array<Product>    				{ return _productionObject; }
    public function set_productionObject(po:Array<Product>):Array<Product>  { _productionObject = po; return _productionObject; }

    public function requiresPower():Bool 									{ return _requiresPower; }
    public function requiresManPower():Bool 								{ return _requiresManPower; }

    public function maxManPower():Int 										{ return _maxManPower; }
    public function getPrice():Int 											{ return _price; }
    public function getInfluenceArea():String 								{ return _influenceArea; }
	public function getProductionType():String 								{ return _productionType; }

    public function getProduction():Int
    {
    	return _production;
    }

    public function getProductionRate():Float
    {
    	return _productionRate;
    }

    public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Dynamic)
    {
    	super(X, Y, SimpleGraphic);
    }

    public function load(data:Object):Void
    {
    	_requiresPower = data.requiresPower;
    	_influenceArea = data.area;
    	_currTechLevel = _initialTechLevel = data.techLevel;
    	_productionType = data.productionType;
    	_productionRate = data.productionRate;
    	_name = data.name;
    	_holdTile = data.holdTile;
    	_buildingMaxDmg = data.buildingMaxDmg;
    	_maxProduction = data.maxProduction;
    	_requiresManPower = data.requiresManPower;
    	_maxManPower = data.maxManPower;
    	this.solid = false;
    	this.moves = false;
    }

    override public function update():Void
    {
    	super.update();
    	if (this.alive) 
		{
			if (_power || !_requiresPower)
			{
    			if (_requiresManPower && _currentManPower < _maxManPower)
				{
    				manpowerCheck();
    				return;
    			}
    			if (_productionTimer >= _productionRate) 
				{
					productionCheck();
				}
    			_productionTimer += FlxG.elapsed;
    		} 
			else
			{
    			trace("NO POWER - REQUIRES POWER");
    		}
			if(_buildingMaxDmg <= 0)
			{
    			this.kill();
    		}
    	}
    }

    function manpowerCheck():Void
    {
    	if (CompostG.getProductAmountByType("clone") < _maxManPower) 
		{
			trace("wORKERS PLEASE");
    		return;
    	} 
		else
		{
    		if (_requestedManPower < _maxManPower)
			{
    			if (_manPowerEnablerTimer > _manPowerMaxPower) 
				{
    				_manPowerEnablerTimer = 0;
					_requestedManPower++;
					trace("REQUESTING MAN POWER");
					CompostG.GRID_MAP.useProduct("clone", 1, this);
    				return;
    			}
				_manPowerEnablerTimer += FlxG.elapsed;
    		} 
    	}
    }

    function productionCheck():Void
    {
    	if (_production <= _maxProduction)
		{
    		_production++;
    		_productionTimer = 0;
    		var p:Product = ProductionFactory.instance().buildProduct(_productionType, new FlxPoint(x - 18, y - 18), this);
    		if (p != null) 
			{
    			_productionObject.push(p);
    			CompostG.GRID_MAP.addProduct(p);
    			p.prodParent = this;
				p.productType = _productionType;
			}
    		CompostG.updateProductAmount(_productionType, 1);
    	}
    }
	
	public function addWorker(worker :Clone) :Void
	{
		for (i in 0 ... _workers.length)
		{
			if(_workers[i] == worker)
			{
				return;	
			}
			 
		}

		_workers.push(worker);
		_currentManPower++;
		trace("WORKER ADDED");
	}
	
	public function removeWorker(worker :Clone) :Void
	{
		for (i in 0 ... _workers.length)
		{
			if (_workers[i] == worker)
			{
				_workers.splice(i, 1);
				_currentManPower--;
				return;
			}
		}
	}

    override public function kill():Void
    {
    	super.kill();
    	for (i in 0 ... _productionObject.length)
		{
    		_productionObject[i].kill();
    		_productionObject[i].visible = false;
    	}
    	_productionObject = new Array();
    }
}
