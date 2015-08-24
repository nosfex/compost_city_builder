package;

import buildings.BuildingFactory;
import camera.CameraController;
import category.CategoryData;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import gui_selector.Selector;
import grid.GridMap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private var _map :GridMap;
	private var _buildingFactory :BuildingFactory ;
	private var _categoryData :CategoryData;
	private var _selector :gui_selector.Selector;
	private var _moneyTxt :FlxText;
	private var _camControl : CameraController;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_map = new GridMap();
		_map.initMap(9);
		add(_map);
		
		BuildingFactory.instance();
		_categoryData = new CategoryData();

		_selector = new Selector();
		_selector.initSelector(_categoryData);
		_selector.scrollFactor.set();
		add(_selector);
		
		CompostG.updateProductAmount("money", 10);
		
		_moneyTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.051, 200, "");
		_moneyTxt.scrollFactor.set();
		_camControl = new CameraController( -FlxG.width * .15, -FlxG.height * .25, FlxG.width , FlxG.height );
		add(_camControl);
		
		FlxG.camera.follow(_camControl, 0, null, 0);
		
		FlxG.camera.setBounds( -FlxG.width / 2, -FlxG.height / 2, FlxG.width * 2, FlxG.height * 2);
		add(_moneyTxt);
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
			_map.addGrids();
		}
			
		_moneyTxt.text = "MONEY: " + CompostG.getProductAmountByType("money");
	}	
}