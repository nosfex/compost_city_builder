package gui_selector;

import flixel.group.FlxSpriteGroup;
import category.CategoryData;
import flixel.ui.FlxButton;
import flixel.FlxG;
/**
 * ...
 * @author Gerardo Heidel
 */
class Selector extends FlxSpriteGroup
{	
	
	var categoryButtons :Array<FlxButton> = new Array();
	var internalCategoryButtons : Map<FlxButton, Array<FlxButton>> = new Map();
	var _buttonHeight : Float = 50;
	
	public function new() 
	{
		
	}
	
	private function buildCategoryButton(XBase: Float, YBase: Float, categoryName : String, category: CategoryData) :Void
	{
	
		var data : Map<String, Array<String>> = category.getHeadlines();
		
		
		var  innerData :Array<String> = data[catName];
		
		
		
		var btn :FlxButton = new FlxButton(XBase, YBase, categoryName, selectCategory);
		add(btn);
		categoryButtons.push(btn);

		

		for(i in 0 ... innerData.length())
		{
			internalCategoryButtons[btn].push(buildBuildingButton(XBase, YBase + i * _buttonHeight, innerData[i] ));
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
		
	}

	private function selectCategory() :Void
	{
		for(btn in categoryButtons)
		{
			var p : FlxPoint = new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY);
			var r :FlxRect = new FlxRect(btn.x, btn.y, btn.width * btn.scale.x, btn.height * btn.scale.y);
			if (p.inFlxRect(r))
			{
				unrollCategory(btn.text);
			}
		}

	}

	private function unrollCategory(category : String) :Void
	{

		var selectedBtn : FlxButton ;
		for(btn in categoryButtons)
		{
			if(btn.text == category)
			{
				selectedBtn = btn;
			}

			for(i in 0 ... internalCategoryButtons[btn].length())
			{
				internalCategoryButtons[btn][i].visible = false;

			}
			
		}

		for(btn in categoryButtons)
		{
			// GH: skip sameness
			if(btn == selectedBtn)
				continue;
			if(btn.y < selectedBtn.y)
			{
				// GH: Expand to lower side

			}
		}


	}
}