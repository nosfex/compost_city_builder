package gui_selector;

import buildings.BuildingFactory;
import flixel.group.FlxSpriteGroup;
import category.CategoryData;
import flixel.system.FlxVersion;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import grid.BaseGrid;

/**
 * ...
 * @author Gerardo Heidel
 */
class Selector extends FlxSpriteGroup
{	
	
	var categoryButtons :Array<FlxButton> = new Array();
	var functionButtons :Array<FlxButton> = new Array();
	var initPosY : Map<FlxButton, Float> = new Map();
	var internalCategoryButtons : Map<FlxButton, Array<FlxButton>> = new Map();
	var _buttonHeight : Float = 50;
	var px : Float;
	var py : Float;
	var camOffsetX : Float ;
	
	var selectionText : FlxText;
	
	var buttonContainer : FlxSprite;
	var bkg:FlxSprite;
	var categoryData : CategoryData;
	
	@:isVar public var selectedGrid(default, default) : BaseGrid = null;
	@:isVar public var selectorLocked(default, default) :Bool = false;
	@:isVar public var overSelector(default, default) :Bool = false;
	public function new()  
	{
		super();
	}
	
	// GH: Initialize the basic bkg and the popup bar
	public function initSelector(data :CategoryData) :Void
	{
		x = 0;
		y = 0;
		px = 0;
		bkg = new FlxSprite(x, FlxG.height * .9, null);
		// GH: Use a primitive for now
		bkg.makeGraphic(cast(FlxG.width * 0.25), cast(FlxG.height * .10), FlxColor.TEAL);
		bkg.scrollFactor.set(0, 0);
		add(bkg);
		
		camOffsetX = -px - x ;
		
		selectionText = new FlxText(FlxG.width * 0.05, FlxG.height * .95, 200, "NOPE");
		add(selectionText);
		
		buttonContainer = new FlxSprite(FlxG.width * .35, FlxG.height, null);
		buttonContainer.makeGraphic(cast(FlxG.width * .4), cast(FlxG.height * .25), FlxColor.TEAL);
		buttonContainer.scrollFactor.set(0, 0);
		add(buttonContainer);
		
		categoryData = new CategoryData();
	}
	
	public function checkClearSelection() :Void
	{
		var mp : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
		var bcRect :FlxRect = new FlxRect(buttonContainer.x, buttonContainer.y, buttonContainer.width, buttonContainer.height);
		if (bcRect.containsFlxPoint(mp))
		{
			return;
		}
		else clearSelection();
	}
	
	// GH: clear selection
	public function clearSelection() : Void
	{
		selectionText.text = "";
		removeButtonContainer();
		selectorLocked = false;
		clearSelectedGrid();
	}
	
	// GH: 
	private function clearSelectedGrid() :Void
	{
		if (selectedGrid != null)
		{
			selectedGrid.selected = false;
			selectedGrid = null;
		}
	}
	// GH: Grid sets
	public function setSelected(grid : grid.BaseGrid	) :Void
	{
		clearSelectedGrid();

		if (grid.getBuilding() != null)
		{
			populateFunctionButtons(grid);
			pushButtonContainer();
		}
		else
		{
			selectionText.text = "SUCH GRID";
			// GH: Construction UI
			populateBuildingButtons();
			pushButtonContainer();
		}
		selectedGrid = grid;
		selectedGrid.selected = true;
		selectorLocked = true;
	}
	
	function removeButtonContainer() : Void
	{
		// GH: Run animation for all the contained objects
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(buttonContainer, { y:FlxG.height }, 0.25, options); 
		for (i in 0 ... categoryButtons.length)
		{
			FlxTween.tween(categoryButtons[i], { y: FlxG.height }, 0.25, options);
			for (j in 0 ... internalCategoryButtons[categoryButtons[i]].length)
			{
				internalCategoryButtons[categoryButtons[i]][j].visible = false;
				
			}
			
			categoryButtons[i].visible = false;
		}
		
		for (i in 0 ... functionButtons.length)
		{
			functionButtons[i].visible = false;
		}
	}
	
	public function checkPassthrough() :Bool
	{	
		var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
		var r :FlxRect = new FlxRect(buttonContainer.x, buttonContainer.y, buttonContainer.width , buttonContainer.height);
		if (p.inFlxRect(r))
		{
			return false;
		}
		
		return true;
	}
	
	// GH: push container
	function pushButtonContainer() : Void
	{
		// GH: Run animation for all the contained objects
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadIn };
		FlxTween.tween(buttonContainer, { y:FlxG.height * .75 }, 0.25, options); 
		// GH: Category buttons tweeening
		for (i in 0 ... categoryButtons.length)
		{
			FlxTween.tween(categoryButtons[i], { y: FlxG.height * (1.05 + (i) * .05) - FlxG.height * .25 }, 0.25, options);
		}
		// GH: Function buttons tweeening
		for (i in 0 ... functionButtons.length)
		{
			FlxTween.tween(functionButtons[i], { y: FlxG.height * (1.05 + (i) * .05) - FlxG.height * .25 }, 0.25, options);
		}
	}
	
	// GH: building buttons for selector
	function populateBuildingButtons() :Void
	{
		for (i in 0 ... categoryButtons.length )
		{
			remove(categoryButtons[i], true);
		}
		categoryButtons = new Array();
		// GH: Determine what the fuck are we working with
		// GH: On an empty block, load regular buildings
		buildCategoryButton(FlxG.width * .38, FlxG.height * 1.05, "Energy", categoryData);
		buildCategoryButton(FlxG.width * .38, FlxG.height * 1.10, "Housing", categoryData);
		buildCategoryButton(FlxG.width * .38, FlxG.height * 1.15, "Production", categoryData);
	}
	
	function onBuildingConstruction() :Void
	{
		
	}
	
	private function populateFunctionButtons(grid : BaseGrid) : Void
	{
		selectionText.text = grid.getBuilding().name;
		FlxG.log.add("Functions: " + grid.getBuilding().availableFunctions.toString());
		
		for (i in 0 ... functionButtons.length )
		{
			remove(functionButtons[i], true);
		}
		
		functionButtons = new Array();
		
		for (i in 0 ... grid.getBuilding().availableFunctions.length)
		{
			// GH: Pull up special ui (upgrade, delete, etc)
			buildFunctionButton(50, FlxG.height * 1.05 + (0.1 * i), grid.getBuilding().availableFunctions[i]);
			//buildFunctionButton()
		}
	}
	
	// GH: Build function buttons
	private function buildFunctionButton(XBase: Float, YBase: Float, buttonName : String) :Void
	{
		var btn :FlxButton = new FlxButton(buttonContainer.x + XBase, YBase, buttonName, selectFunction);
		functionButtons.push(btn);
		add(btn);
	}

	// GH: Only builds categories for unnocupied grid
	private function buildCategoryButton(XBase: Float, YBase: Float, categoryName : String, category: CategoryData) :Void
	{
		var data : Map<String, Array<String>> = category.getHeadlines();
		var innerData :Array<String> = data[categoryName];
		var btn :FlxButton = new FlxButton(XBase, YBase, categoryName, selectCategory);
		
		add(btn);
		btn.ID = 
		categoryButtons.push(btn);
		initPosY[btn] = YBase;
		internalCategoryButtons[btn] = new Array();
		var modYCount :Int = 0;
		// GH: Build internal buttons for categories
		for(i in 0 ... innerData.length)
		{
			modYCount += (i % 5) == 0 ? 1 : 0;
			internalCategoryButtons[btn].push(buildBuildingButton(XBase + 10 + i * _buttonHeight, FlxG.height * .78 + ( modYCount * _buttonHeight), innerData[i] ));
		}
	}
	
	private function buildBuildingButton(X :Float, Y :Float, building: String) :FlxButton
	{
		var btn :FlxButton = new FlxButton(X, Y, building, selectBuilding);
		btn.visible = false;
		add(btn);
		return btn;
	}
	
	
	private function selectBuilding() :Void
	{
		for(btn in categoryButtons)
		{
			for(i in 0 ... internalCategoryButtons[btn].length)
			{
				var curBtn :FlxButton = internalCategoryButtons[btn][i];
				if (!curBtn.visible)
					continue;
				var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
				var r :FlxRect = new FlxRect(curBtn.x + camOffsetX, curBtn.y, curBtn.width * curBtn.scale.x, curBtn.height * curBtn.scale.y);
				if (p.inFlxRect(r))
				{
					buildings.BuildingFactory.CURRENT_BUILDING = curBtn.text;
					selectedGrid.addBuilding(buildings.BuildingFactory.instance().createBuildingInstance());
					FlxG.log.add("BUILDING TO BUILD: " + curBtn.text);
					CompostG.FUNC_BUTTON = "";
					for (j in 0 ... internalCategoryButtons[btn].length)
					{
						var auxBtn :FlxButton = internalCategoryButtons[btn][j];
						auxBtn.visible = false;
					}
					clearSelection();
					
					return;
				}
			}
		}
	}
	
	private function selectFunction() :Void
	{
		for(btn in functionButtons)
		{
			var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(btn.x + camOffsetX, btn.y, btn.width * btn.scale.x, btn.height * btn.scale.y);
			if (p.inFlxRect(r))
			{
				CompostG.FUNC_BUTTON = btn.text;
				trace("FUNCTION" + btn.text);
				selectedGrid.processFunction(CompostG.FUNC_BUTTON);
			}
		}
	}
	
	private function selectCategory() :Void
	{
		for(btn in categoryButtons)
		{
			var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(btn.x+ camOffsetX, btn.y, btn.width * btn.scale.x, btn.height * btn.scale.y);
			if (p.inFlxRect(r))
			{
				unrollCategory(btn);
			}
		}
		
	}

	private function unrollCategory(button :FlxButton) :Void
	{

		var selectedBtn : FlxButton ;
		for(btn in categoryButtons)
		{
			
			//btn.y = initPosY[btn];
			btn.visible = false;
		}
		
		for(i in 0 ... internalCategoryButtons[button].length)
		{
			var data :Array<FlxButton> = internalCategoryButtons[button];
			data[i].visible = true;
		}

	}
}