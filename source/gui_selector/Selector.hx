package gui_selector;

import flixel.group.FlxSpriteGroup;
import category.CategoryData;
import flixel.system.FlxVersion;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import flixel.util.FlxColor;
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
	public var bkg:FlxSprite;
	
	
	public function new() 
	{
		super();
	}
	
	// GH: Initialize the basic bkg and the popup bar
	public function initSelector(data :CategoryData) :Void
	{
		x = 0;
		y = FlxG.height * .9;
		px = 0;
		bkg = new FlxSprite(x, y, null);
		// GH: Use a primitive for now
		bkg.makeGraphic(cast(FlxG.width * 0.25), cast(FlxG.height * .10), FlxColor.TEAL);
		add(bkg);
		
		camOffsetX = -px - x ;
	/*	buildCategoryButton(px +FlxG.width * 0.05, py + FlxG.height * 0.1, "Energy", data);
		buildCategoryButton(px +FlxG.width * 0.05, py + FlxG.height * 0.2, "Production", data);
		buildCategoryButton(px + FlxG.width * 0.05, py + FlxG.height * 0.3, "Housing", data);
		buildFunctionButton(px + FlxG.width * 0.05, py + FlxG.height * 0.8, "Erase");*/
	}
	
	// GH: Deprecated
	private function buildFunctionButton(XBase: Float, YBase: Float, buttonName : String) :Void
	{
		var btn :FlxButton = new FlxButton(XBase, YBase, buttonName, selectFunction);
		functionButtons.push(btn);
		add(btn);
	}

	// GH: Deprecated
	private function buildCategoryButton(XBase: Float, YBase: Float, categoryName : String, category: CategoryData) :Void
	{
		var data : Map<String, Array<String>> = category.getHeadlines();
		var  innerData :Array<String> = data[categoryName];
		var btn :FlxButton = new FlxButton(XBase, YBase, categoryName, selectCategory);
		
		add(btn);
		btn.ID = 
		categoryButtons.push(btn);
		initPosY[btn] = YBase;
		internalCategoryButtons[btn] = new Array();
		
		for(i in 0 ... innerData.length)
		{
			internalCategoryButtons[btn].push(buildBuildingButton(XBase + 10, YBase + ( (i + 1) * _buttonHeight), innerData[i] ));
		}
	}
	
	// GH: Deprecated
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
					CompostG.FUNC_BUTTON = "";
					
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
			
			btn.y = initPosY[btn];
				
			for(i in 0 ... internalCategoryButtons[btn].length)
			{
				var vis :Bool = false;
				var data :Array<FlxButton> = internalCategoryButtons[btn];
				if(btn == button)
				{
					vis = true;
				}
				data[i].visible = vis;

				if(btn.y <= button.y)
				{
					continue;
				}

				else
				{
					FlxG.log.add("MOVE THE " + btn + " DOWN");
					FlxG.log.add("DATA POS " + data[data.length - 1].y);
					btn.setPosition(button.x, button.y  + (data[data.length - 1].y + 15));	
				}
			}
		}

	}
}