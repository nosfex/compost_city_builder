package gui_selector;

import flixel.group.FlxSpriteGroup;
import category.CategoryData;
import flixel.ui.FlxButton;
/**
 * ...
 * @author Gerardo Heidel
 */
class Selector extends FlxSpriteGroup
{	
	
	public function new() 
	{
		
	}
	
	private function buildCategoryButton(category: CategoryData) :Void
	{
		
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
}