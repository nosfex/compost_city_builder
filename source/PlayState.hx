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
import flixel.util.FlxPoint;
import world.WorldData;

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
	
	private var _worldData :WorldData;
	var hudCam:FlxCamera;
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

		
		_moneyTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.051, 200, "");
		
		_moneyTxt.scrollFactor.set();
		_camControl = new CameraController(0, 0, FlxG.width * .75 , FlxG.height  * .85);
		add(_camControl);
		
		_selector = new Selector();
		_selector.initSelector(_categoryData);
		_selector.scrollFactor.set(0, 0);
		add(_selector);
		CompostG.updateProductAmount("money", 10);
		//CompostG.UI_SELECTOR = _selector;
		
		FlxG.camera.follow(_camControl, 0, null, 0);
		FlxG.camera.setBounds(0, 0, FlxG.width * 2, FlxG.height * 2);
		add(_moneyTxt);
		
		//hudCam = new FlxCamera(cast(FlxG.width * 0), 0, cast(FlxG.width *.25 ), FlxG.height);
		
		//FlxG.cameras.add(hudCam);
		//hudCam.zoom = 1;
		//hudCam.follow(_selector.bkg, FlxCamera.STYLE_LOCKON, new FlxPoint(0, FlxG.height));
		
		_worldData = new WorldData();
		_worldData.init();	
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