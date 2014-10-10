package;

import buildings.BuildingFactory;
import category.CategoryData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import grid.GridMap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private var _map :GridMap;
	
	private var _buildingFactory :BuildingFactory ;
	private var _categoryData :CategoryData;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_map = new GridMap();
		
		_map.initMap(16);
		add(_map);
		
		_buildingFactory = new BuildingFactory();
		_categoryData = new CategoryData();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		if (FlxG.keys.justReleased.A)
		{
			_map.addGrids(1);
		}
	}	
}