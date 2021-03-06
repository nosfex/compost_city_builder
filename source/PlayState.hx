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
import flixel.math.FlxMath;
import gui_selector.Selector;
import grid.GridMap;
import flixel.math.FlxPoint;
import simulation.SimulationController;
import simulation.SimulationDayEvent;
import world.World;
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
	
	private var _mineralTxt :FlxText;
	private var _waterTxt : FlxText;
	private var _moneyTxt :FlxText;
	private var _dateTxt : FlxText;
	
	private var _camControl : CameraController;
	private var _worldData :WorldData;
	private var _world :World;
	// GH: Timer manager
	
	private var _simulator :SimulationController;
	
	var hudCam:FlxCamera;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_world = new World();
		_world.generateMapResourcesData(9);
		
		BuildingFactory.instance();
		_map = new GridMap();
		_map.world = _world;
		_map.initMap(9);
		add(_map);
		
		_categoryData = new CategoryData();
		// GH: Temporal money text
		_moneyTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.051, 200, "");
		_moneyTxt.scrollFactor.set();
		_mineralTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.1, 200, "");
		_mineralTxt.scrollFactor.set();
		_waterTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.151, 200, "");
		_waterTxt.scrollFactor.set();
		
		_dateTxt = new FlxText(FlxG.width * 0.9, FlxG.height * 0.201, 200, "");
		_dateTxt.scrollFactor.set();
		
		
		_camControl = new CameraController(0, 0, FlxG.width * .75 , FlxG.height  * .85);
		add(_camControl);
		
		// GH: Root of all evil, the menu
		_selector = new Selector();
		add(_selector);
		_selector.initSelector(_categoryData);
		_selector.scrollFactor.set(0, 0);
		
		CompostG.updateProductAmount("money", 1000);
		CompostG.updateProductAmount("mineral", 0);
		CompostG.UI_SELECTOR = _selector;
		// GH: Init camera controls, set initial world bounds, these bounds are not really good btw
		FlxG.camera.follow(_camControl, FlxCameraFollowStyle.LOCKON, 1);
		FlxG.camera.setScrollBoundsRect(0, 0, FlxG.width * 2, FlxG.height * 2);
		
		add(_moneyTxt);
		add(_mineralTxt);
		add(_waterTxt);
		add(_dateTxt );
		
		// GH: World setup
		CompostG.CAM = _camControl;
		CompostG.GRID_MAP = _map;
		
		add(_world);
		_simulator = new SimulationController();
		_simulator.addEventListener(SimulationDayEvent.DAY_OVER, _map.onDayPassed);
		
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
	override public function update(elapsed :Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justReleased.A)
		{
			_map.addGrids();
		}
		
		if (FlxG.keys.justReleased.F)
		{
			_map.focusOnCenterGrid();
		}
		
		_moneyTxt.text = "MONEY: " + CompostG.getProductAmountByType("money");
		_mineralTxt.text = "MINERAL: " + CompostG.getProductAmountByType("mineral");
		_waterTxt.text = "WATER: " + CompostG.getProductAmountByType("water");
		_dateTxt.text = "DATE: " + _simulator.currentDay + " / " + _simulator.currentMonth + " / " + _simulator.currentYear; 
		
		
	}	
}