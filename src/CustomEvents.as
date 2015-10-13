package 
{
import flash.events.Event;

public class CustomEvents extends Event {
   
	public static const LAUNCH_GAME:String = "launch_game";
	
	public function CustomEvents(e:String):void {
		super(e);
		
	}
	
}
	
}