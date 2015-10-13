package
{
	import flash.display.Sprite;
	import flash.events.Event; 
	import flash.text.TextField;
	import Paddle;
	import CustomEvents;
	import MainMenu;
	
	/**
	 * ...
	 * @author Jiantao
	 */
   
	public class Main extends Sprite 
	{
		private var paddle:Paddle;
		private var game:PongGame;
		private var menu:MainMenu;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		//	paddle = new Paddle();
		//	addChild(paddle);
		   var myname:TextField = new TextField();
		   myname.textColor = 0xFFFF00;
			myname.x = 244;
			myname.y = 0;
			myname.text = "Jiantao Hu (jh2468) ";
			addChild(myname);
		    buildMenu();
			
		}
		
		private function buildMenu():void {
			menu = new MainMenu();
		   addChild(menu);
		   menu.addEventListener(CustomEvents.LAUNCH_GAME, startGame, false, 0, true);
		}
		
		private function startGame(e:CustomEvents):void {
		   removeChild(menu);
		   menu.removeEventListener(CustomEvents.LAUNCH_GAME, startGame);
		   menu = null;
		   game = new PongGame();
		   addChild(game);
		}
		
	}
	
}