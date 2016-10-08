package tasks;

/**
 * ...
 * @author Gerardo Heidel
 */
class TaskManager
{
	
	public function new() 
	{
		
	}
	
	
	private var _tasks : Map<String, Task> = new Map<String, Task>();
	
	public function init() :Void
	{
		var fileContent = File.getContent(AssetPaths.tasks__json);
		var jsonTasks :Dynamic = Json.parse(fileContent);
		
		for (i in 0 ... jsonTasks.tasks.length)
		{	
			var task : Task = new Task();
			
			
		}
	}
}