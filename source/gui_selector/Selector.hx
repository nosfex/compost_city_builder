package gui_selector;

import buildings.BuildingFactory;
import flixel.group.FlxSpriteGroup;
import category.CategoryData;
import flixel.system.FlxVersion;
import flixel.text.FlxText;
import flixel.ui.FlxBitmapTextButton;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
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
	
	var _buttonContainer : FlxSprite;
	var bkg:FlxSprite;
	var _topBar : FlxSprite;
	var categoryData : CategoryData;
	var _descriptionTxt : FlxText;
	var _latestCategoryBtn:FlxButton;
	
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
		bkg.makeGraphic(cast(FlxG.width * 0.25), cast(FlxG.height * .10), FlxColor.GREEN);
		bkg.scrollFactor.set(0, 0);
		add(bkg);
		
		camOffsetX = -px - x ;
		
		selectionText = new FlxText(FlxG.width * 0.05, FlxG.height * .95, 200, "NOPE");
		add(selectionText);
		// GH: Button container where all the buttons go
		_buttonContainer = new FlxSprite(FlxG.width * .35, FlxG.height, null);
		_buttonContainer.makeGraphic(cast(FlxG.width * .4), cast(FlxG.height * .25), FlxColor.GREEN);
		_buttonContainer.scrollFactor.set(0, 0);
		add(_buttonContainer);
		// GH: Top bar where all the data on the rollover stuff goes
		_topBar = new FlxSprite(FlxG.width * .35, -FlxG.height * 0.1, null);
		_topBar.makeGraphic(cast(FlxG.width * .4), cast(FlxG.height * .1), FlxColor.GREEN);
		_topBar.scrollFactor.set(0, 0);
		add(_topBar);
		
		_descriptionTxt = new FlxText(FlxG.width * .356, -FlxG.height * 0.1, 200, "DESCRIPTION");
		add(_descriptionTxt);
		
		
		categoryData = new CategoryData();
	}
	
	public function checkClearSelection() :Void
	{
		if (CompostG.getMouseOverRect(_buttonContainer))
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
		onOutBuildingBuy();
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
		selectedGrid = grid;
		selectedGrid.selected = true;
		selectorLocked = true;
		if (grid.getBuilding() != null)
		{
			populateFunctionButtons(grid);
			pushButtonContainer();
		}
		else
		{
			switch(grid.type)
			{
				case BaseGrid.MINERAL_GRID:
					selectionText.text = "MINERAL";
				case BaseGrid.WATER_GRID:
					selectionText.text = "WATER";
				case BaseGrid.NORMAL_GRID:
					selectionText.text = "DIRT";
			}
			// GH: Construction UI
			populateBuildingButtons();
			pushButtonContainer();
		}
	}
	
	function removeButtonContainer() : Void
	{
		// GH: Run animation for all the contained objects
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(_buttonContainer, { y:FlxG.height }, 0.25, options); 
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
		if (CompostG.getMouseOverRect(_buttonContainer))
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
		FlxTween.tween(_buttonContainer, { y:FlxG.height * .75 }, 0.25, options); 
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
		// GH: On an empty block, load regular buildings
		// GH: Check first for a filtered block
		for (i in 0 ... selectedGrid.categoryFilter.length)
		{
			buildCategoryButton(FlxG.width * .38, FlxG.height * (1.05 + i * 0.05) , selectedGrid.categoryFilter[i], categoryData);
		}
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
		var btn :FlxButton = new FlxButton(_buttonContainer.x + XBase, YBase, buttonName, selectFunction);
		btn.onOver = new FlxButtonEvent(onOverBuildingFunction);
		btn.onOut = new FlxButtonEvent(onOutBuildingFunction);
		functionButtons.push(btn);
		add(btn);
	}
	
	// GH: Callback for the function button
	private function onOverBuildingFunction() : Void
	{
		// GH: Tween the top bar + description Txt for this funciton
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(_topBar, { y:0 }, 0.25, options); 
		FlxTween.tween(_descriptionTxt, { y:FlxG.height * 0.02 }, 0.25, options);
		// GH: Grab a hacked description
		for (i in 0 ... functionButtons.length)
		{
			if (CompostG.getMouseOverRect(functionButtons[i], new FlxPoint(camOffsetX, 0), functionButtons[i].scale ))
			{
				_descriptionTxt.text = (selectedGrid.getBuilding().getFunctionDescriptionByName(functionButtons[i].text));
			}
		}	
	}
	
	// GH: Tween out the description text + bar
	private function onOutBuildingFunction() :Void
	{
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(_topBar, { y:-FlxG.height * 0.1 }, 0.25, options); 
		FlxTween.tween(_descriptionTxt, { y:-FlxG.height * 0.1}, 0.25, options);
	}
	
	// GH: Only builds categories for unnocupied grid
	private function buildCategoryButton(XBase: Float, YBase: Float, categoryName : String, category: CategoryData) :Void
	{
		var data : Map<String, Array<String>> = category.getHeadlines();
		var innerData :Array<String> = data[categoryName];
		var btn :FlxButton = new FlxButton(XBase, YBase, categoryName, selectCategory);
		
		add(btn);
		btn.ID = categoryButtons.push(btn);
		initPosY[btn] = YBase;
		internalCategoryButtons[btn] = new Array();
		var modYCount :Int = 0;
		// GH: Build internal buttons for categories
		var iCount :Int = -1;
		
		for(i in 0 ... innerData.length)
		{
			var forceContinue : Bool = true;
			
			for (j in 0 ... selectedGrid.buildingFilter.length)
			{
				if (selectedGrid.buildingFilter[j] == innerData [i])
				{
					iCount = i;
					forceContinue = false;
					break;
				}
			}
			if (forceContinue)
			{
				continue;
			}
			modYCount += (iCount % 5) == 0 ? 1 : 0;
			internalCategoryButtons[btn].push(buildBuildingButton(XBase + 20 + iCount * (_buttonHeight * 2), FlxG.height * .78 + ( modYCount * _buttonHeight), innerData[iCount] ));
		}
	}
	
	private function buildBuildingButton(X :Float, Y :Float, building: String) :FlxButton
	{
		var btn :FlxButton = new FlxButton(X, Y, building, selectBuilding);
		btn.visible = false;
		btn.onOver = new FlxButtonEvent(onOverBuildingBuy);
		btn.onOut = new FlxButtonEvent(onOutBuildingBuy);
		add(btn);
		return btn;
	}
	
	private function onOverBuildingBuy() :Void
	{
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(_topBar, { y:0 }, 0.25, options); 
		FlxTween.tween(_descriptionTxt, { y:FlxG.height * 0.02 }, 0.25, options);
		// GH: Grab a hacked description
		for (i in 0 ...  internalCategoryButtons[_latestCategoryBtn].length)
		{
			var button : FlxButton = internalCategoryButtons[_latestCategoryBtn][i];
			if (CompostG.getMouseOverRect( button, new FlxPoint(camOffsetX, 0),  button.scale ))
			{
				var price :String = BuildingFactory.instance().getBuildingDescription(button.text) + "\n" + BuildingFactory.instance().getBuildingPrice(button.text);
				_descriptionTxt.text = price;
			}
		}	
	}
	
	private function onOutBuildingBuy() :Void
	{
		var options: TweenOptions = { type: FlxTween.PERSIST, ease:FlxEase.quadOut };
		FlxTween.tween(_topBar, { y:-FlxG.height * 0.1}, 0.25, options); 
		FlxTween.tween(_descriptionTxt, { y:-FlxG.height * 0.1 }, 0.25, options);
		
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
				
				if (CompostG.getMouseOverRect(curBtn, new FlxPoint(camOffsetX, 0), curBtn.scale))
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
			if (CompostG.getMouseOverRect(btn, new FlxPoint(camOffsetX, 0),  btn.scale))
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
			if (CompostG.getMouseOverRect(btn, new FlxPoint(camOffsetX, 0), btn.scale))
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
		
		_latestCategoryBtn = button;

	}
}