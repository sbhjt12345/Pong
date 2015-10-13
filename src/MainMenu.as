package
{
	import flash.display.Sprite;
	import flash.events.Event; 
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	
	public class MainMenu extends Sprite 
	{
		private var pongButton:Sprite;
		private var startu:Sound = new Assets.startup();
		private var insmsg:Sprite;
		private var insmsg2:Sprite;
		private var insmsg3:Sprite;
		private var insmsg4:Sprite;
		private var insmsg5:Sprite;
	/**	
	    [Embed (source = '../lib/startup.mp3')] 
		private static var startup:Class;
		private static var sound:Sound;
	*/
		
		public function MainMenu():void 
		{
		   addEventListener(Event.ADDED_TO_STAGE, go);
		}
		
		private function go(e:Event):void {
		  removeEventListener(Event.ADDED_TO_STAGE, go);
		  pongButton = item("Click to Play", 220, 360, launchGame, 0xFFFF00);
		  insmsg = instruction("P1 press w/s to move up/down", 220, 170, 0xFFFF00);
		  insmsg2 = instruction("P2 press up/down arrow to move up/down", 190, 200, 0xFFFF00);
		  insmsg3 = instruction("made by Jiantao Hu (jh2468)", 220, 230, 0xFFFF00);
		  insmsg4 = instruction("after click to play, press mouse again and press any key", 170, 260);
		  insmsg5 = instruction("to release the ball", 170, 290);
		  addChild(pongButton);
		  addChild(insmsg);
		  addChild(insmsg2);
		  addChild(insmsg3);
		  addChild(insmsg4);
		  addChild(insmsg5)
		}
		
		private function launchGame(e:MouseEvent):void {
			startu.play();
			dispatchEvent(new CustomEvents(CustomEvents.LAUNCH_GAME));
	/**		sound = (new startup) as Sound;
			sound.play();
	*/
			
			
		}
		
		private function item(buttonText:String, x:int, y:int, Fun:Function, txtcolot:uint = 0xFFFFFF):Sprite {
			var item:Sprite = new Sprite();
			item.graphics.beginFill(0);
			item.graphics.lineStyle(1, txtcolot, 0.5);
			item.graphics.drawRect(0, 0, 100, 30);
			var myText:TextField = new TextField();
			myText.selectable = false;
			myText.width = 100;
			myText.height = 30;
			item.addChild(myText);
			myText.autoSize = "center";
			myText.text = buttonText;
			myText.textColor = txtcolot;
			item.addEventListener(MouseEvent.CLICK, Fun);
			item.x = x;
			item.y = y;
			return item;
		}
		
		private function instruction(word:String, x:int, y:int, txtcolot:uint = 0xFFFFFF):Sprite {
		     var instruction:Sprite = new Sprite();
			 var textt:TextField = new TextField();
			 textt.selectable = false;
			 textt.width = 300;
			 textt.thickness = 5;
			 textt.height = 20;
		//	 textt. = new TextFormat("Arial",5000);
			 instruction.addChild(textt);
			 textt.text = word;
			 textt.textColor = txtcolot;
			 instruction.x = x;
			 instruction.y = y;
			 return instruction;
		}
		

	}
	
}