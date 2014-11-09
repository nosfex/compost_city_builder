package buildings;

/**
 * ...
 * @author Gerardo Heidel
 */
class BuildingData
{
	public var	name :String;
	public var	requiresPower :Bool;
	public var	area: String;
	public var	techLevel :Int;
	public var	productionType :String;
	public var	productionRate :Int;
	public var	lockTile :Bool;
	public var 	buildingMaxDmg :Int;
	public var 	maxProduction :Int;
	public var 	holdTile :Bool = false;
	public function new() 
	{
		
	}
	
}