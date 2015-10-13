package{
		import flash.display.Bitmap;
		import flash.display.Shape;
        import flash.display.Sprite;
        import flash.display.Graphics;
        import flash.events.Event;
    
   public class Ball extends Sprite {
	  // private const rad:int = 12;
	   //private const col:uint = ;
	   private var circle:Shape = new Shape();
	   
	 public function Ball():void {
		 addEventListener(Event.ADDED_TO_STAGE, go); 
		 
	 } 
                           
     private function go(e:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, go);
        circle.graphics.beginFill(0x01A6B2, 1);
		circle.graphics.drawCircle(0, 0, 5);
		circle.graphics.endFill();
		addChild(circle);
		 
       } 

    }
}