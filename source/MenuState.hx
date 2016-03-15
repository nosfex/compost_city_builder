package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	var titleField :FlxText;
	var playBtn :FlxButton;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		titleField = new FlxText(FlxG.width * 0.5, FlxG.height * 0.2, 0, "COMPOST CITY BUILDER", 20);
		titleField.x -= titleField.width * 0.5;
		add(titleField);
		
		playBtn = new FlxButton(FlxG.width * 0.5, FlxG.height * 0.7, "PLAY", onPlay);
		playBtn.x -= playBtn.width* 0.5;
		add(playBtn);
	}
	
	
	public function onPlay() :Void
	{
		FlxG.switchState(new PlayState());
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
	override public function update(elapsed:Float ):Void
	{
		super.update(elapsed);
	}	
}