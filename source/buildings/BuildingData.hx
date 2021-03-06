package buildings;

/**
 * ...
 * @author Gerardo Heidel
 */
class BuildingData
{
	public var	name :String;
	public var	requiresPower :Bool;
	public var 	requiresManPower :Bool;
	public var  maxManPower :Int;
	public var	area: String;
	public var	techLevel :Int;
	public var	productionType :String;
	public var	productionRate :Int;
	public var	lockTile :Bool;
	public var 	buildingMaxDmg :Int;
	public var 	maxProduction :Int;
	public var 	holdTile :Bool = false;
	public var  price :Int = 0;
	public var 	upkeepCost :Array<Int> = new Array();
	public var 	currency :Array<String> = new Array();
	public var 	description :String = "CULO";
	
	public var availableFunctions:Array<String> = new Array<String>();
	public function new() 
	{
		
	}
	
}