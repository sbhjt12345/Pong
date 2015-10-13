package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event; 
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import Paddle;
	
	/**
	 * ...
	 * @author Jiantao
	 */
   
	public class PongGame extends Sprite 
	{
		private var paddle:Paddle;
		private var paddle2:Paddle2;
		private var ball:Ball;
		private var speedX:Number;
		private var speedY:Number;
		private var angle:Number;
		private var score1:Sprite;
		private var score2:Sprite; 
		private var ballSpeed:int = 5;
		private var score11:int = 0;
		private var score22:int = 0;
		private var duan:Sound = new Assets.duang();
		private var endd:Sprite;
		private var game:PongGame;
		private var ww:Sound = new Assets.win();
		private var mm:Sound = new Assets.startup();
		private var hh:Sound = new Assets.hit();
		private var nn:Sound = new Assets.neww();

		
		
		public function PongGame():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			paddle = new Paddle();
			paddle2 = new Paddle2();
			ball = new Ball();
			ball.y = stage.stageHeight * 0.5;
			ball.x = stage.stageWidth * 0.5;
			score1 = setScore(score11, 5, 5);
			score2 = setScore(score22, 585, 5);
			
			addChild(paddle);
			addChild(paddle2);
			addChild(ball);
			addChild(score1); addChild(score2);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, releaseBall);
		}
		
		private function releaseBall(e:KeyboardEvent):void { 
		     stage.removeEventListener(KeyboardEvent.KEY_DOWN, releaseBall);
			 addEventListener(Event.ENTER_FRAME, enterframe);
			 angle = Math.random() * 360;
			 if ((angle >= 85 && angle <= 95)||(angle>=175&&angle<=185)) angle = angle+50;
		}
		
		private function enterframe(e:Event):void {
		   speedX = Math.sin(angle * (Math.PI / 180)) * ballSpeed;
		   speedY = Math.cos(angle * (Math.PI / 180)) * ballSpeed;
		   ball.y += speedY;
		   ball.x += speedX;
		   
		   if (ball.y<=0 || ball.y>=400) {
		     angle = 180 -angle;
			 hh.play();
		   }
		      
		   if (ball.x + ball.width >= paddle2.x) {
			   if (ballHit(paddle2)){
			   angle = 360 - angle;
			   duan.play();
			   }
			   else{
				   ball.x = stage.stageWidth * 0.5;
				   ball.y = stage.stageHeight * 0.5;
				   angle = Math.random() * 360;
				   if ((angle >= 85 && angle <= 95)||(angle>=175&&angle<=185)) angle = angle+50;
				   removeChild(score1);
				   score1 = setScore(++score11, 5, 5);
				   addChild(score1);
				   nn.play();
				   if(score11==5){
					removeChild(paddle);
					removeChild(paddle2);
					removeChild(ball);
					ballSpeed = 0;  
					ww.play();
					endd = encore("P1 wins with " + score11.toString() + " : " + score22.toString() + "! Play again?", 220, 300, launchGame);
					addChild(endd);
				   }
		
			   }
		   }
		   if (ball.x <= paddle.x + paddle.width) {
			   if (ballHit(paddle)){
			     angle = 360 - angle;
			     duan.play();
			   }
			   else{
				   ball.x = stage.stageWidth * 0.5;
				   ball.y = stage.stageHeight * 0.5;
				   angle = Math.random() * 360;
				   if ((angle >= 85 && angle <= 95)||(angle>=175&&angle<=185)) angle = angle+50;
				   removeChild(score2);
				   score2 = setScore(++score22, 585, 5);
				   addChild(score2);
				   nn.play();
				   if (score22==5){
					removeChild(paddle);
					removeChild(paddle2);
					removeChild(ball);
					ballSpeed = 0;
					ww.play();
					endd = encore("P2 wins with " + score22.toString() + " : " + score11.toString() + "! Play again?", 220, 300, launchGame);
					addChild(endd);
				   }

			   }
			   
		   }
		   
		}
		
		private function ballHit(t:DisplayObject):Boolean {
		   if (ball.y >= t.y-20 && ball.y + ball.height <= t.y + t.height+20) return true;
		   else return false;
			
		}
		
		
		private function setScore(score:int,x:int, y:int, txtcolot:uint = 0xFFFF00):Sprite {
		   var setScore:Sprite = new Sprite();
		   var scoreText:TextField = new TextField();
		   scoreText.width = 40;
		   scoreText.height = 40;
		   setScore.addChild(scoreText);
		   scoreText.text = score.toString();
		   scoreText.textColor = txtcolot;
		   setScore.x = x;
		   setScore.y = y;
		   return setScore;
		}
		
		private function encore(msg:String,x:int,y:int,fun:Function, txtcolot:uint = 0xFFFF00):Sprite{
			var encore:Sprite = new Sprite();
			encore.graphics.beginFill(0);
			encore.graphics.lineStyle(1, txtcolot, 0.5);
			encore.graphics.drawRect(0, 0, 200, 30);
			var msgText:TextField = new TextField();
			msgText.selectable = false;
			msgText.width = 200;
			msgText.height = 100;
			encore.addChild(msgText);
			msgText.autoSize = "center";
			msgText.text = msg;
			msgText.textColor = txtcolot;
			encore.addEventListener(MouseEvent.CLICK, fun);
			encore.x = x;
			encore.y = y;
			return encore;
			
			
		}
		
		private function launchGame(e:MouseEvent):void {
			removeChild(endd);
			removeChild(score1);
			removeChild(score2);
			score11 = 0;
			score22 = 0;
			game = new PongGame();
			addChild(game);
			mm.play();
			
			}
		
	}
	
}