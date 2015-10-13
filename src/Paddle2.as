package{
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;

   public class Paddle2 extends Sprite {
       private var pic2:Bitmap = new Assets.Pad2();
	   private var movingUp:Boolean;
	   private var movingDown:Boolean;
	   private var speed:int = 10;
	   
       public function Paddle2():void {
		  addEventListener(Event.ADDED_TO_STAGE, go); 
      }
	  
	  private function go(e:Event) : void {
		 removeEventListener(Event.ADDED_TO_STAGE, go);
		 addChild(pic2);
		 x = 600-pic2.width*0.5;
		 y = stage.stageHeight*0.5 - pic2.height*0.5;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, false, 0, true);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler, false, 0, true);
		addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
		//addEventListener(Event.REMOVED_FROM_STAGE, die);
   }
   
   
   private function keyDownHandler(e:KeyboardEvent):void {
	   if (e.keyCode == 38) {
		  movingUp = true; 
	   }
	   else if (e.keyCode == 40) {
		  movingDown = true; 
	   }
   }
   
   private function keyUpHandler(e:KeyboardEvent):void {
	   	if (e.keyCode == 38) {
		    movingUp = false; 
	    }
		else if  (e.keyCode == 40) {
		   movingDown = false;	
		}
   }
   private function enterFrame(e:Event):void {
	    if (movingUp) {
			if (y - speed >= 0) y -= speed;
			else y = 0;
		   
	   }
	   else if (movingDown) {
		  if (y + speed + pic2.height <= 400) y += speed;
		  else y = 400-pic2.height;
	   }
   }   


}
}