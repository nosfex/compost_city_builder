package gui_log;

import flixel.group.FlxSpriteGroup;

/**
 * ...
 * @author Gerardo Heidel
 */
class UILog extends FlxSpriteGroup
{

	@:isVar public var notifications(default, default) :Array<LogEntry> = new Array<LogEntry>();
	
	public function new() 
	{
		super();
	}
	
}