package MyClases
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	public class Player extends Sprite
	{		
		
		[Embed(source="Assets/Player.png")]
		private var APlayer:Class;
		private var MyPlayer:Bitmap = new APlayer;
		private var Step:uint = 3;
		
		// Movement flags
		private var MoveUp:Boolean = false;
		private var MoveRight:Boolean = false;
		private var MoveDown:Boolean = false;
		private var MoveLeft:Boolean = false;
		private var HP:int = 100;
		
		public function Player()
		{
			MyPlayer.scaleX = 0.16;
			MyPlayer.scaleY = 0.16;
			MyPlayer.x = -MyPlayer.width / 2;
			MyPlayer.y = -MyPlayer.height / 2;
			//MyPlayer.x = 400 - (MyPlayer.width / 2);
			//MyPlayer.y = 256 - (MyPlayer.height / 2);
			addChild( MyPlayer );
			
		}
		
		public function getHit(DMGReceived:int):void
		{
			HP -= DMGReceived;			
		}
		
		public function getX():int
		{
			return MyPlayer.x;
		}
		
		public function getY():int
		{
			return MyPlayer.y;
		}
		
		public function getMoveUp():Boolean
		{
			return MoveUp;
		}
		
		public function getMoveDown():Boolean
		{
			return MoveDown;
		}
		
		public function getMoveLeft():Boolean
		{
			return MoveLeft;
		}
		
		public function getMoveRight():Boolean
		{
			return MoveRight;
		}
		
		public function MovePlayerUp():void
		{
			MoveUp = true;
		}
		
		public function MovePlayerDown():void
		{
			MoveDown = true;
		}
		
		public function MovePlayerRight():void
		{
			MoveRight = true;
		}
		
		public function MovePlayerLeft():void
		{
			MoveLeft = true;
		}
		
		public function StopMovingPlayerUp():void
		{
			MoveUp = false;
		}
		
		public function StopMovingPlayerDown():void
		{
			MoveDown = false;
		}
		
		public function StopMovingPlayerRight():void
		{
			MoveRight = false;
		}
		
		public function StopMovingPlayerLeft():void
		{
			MoveLeft = false;
		}
		
		public function DoMove():void
		{
			if( MoveUp == true )
			{
				//MyPlayer.rotation = 270;
				//RotateAroundCenter(MyPlayer, 270);
				this.rotation = 270;
				
				this.y -= Step;
				MoveDown = false;
			}
			
			if( MoveDown == true )
			{
				//MyPlayer.rotation = 90;
				//RotateAroundCenter(MyPlayer, 90);
				this.rotation = 90;
				this.y += Step;
				MoveUp = false;
			}
			
			if( MoveRight == true )
			{
				//MyPlayer.rotation = 0;
				//RotateAroundCenter(MyPlayer, 0);
				this.rotation = 0;
				this.x += Step;
				MoveLeft = false;
			}
			
			if( MoveLeft == true )
			{
				//MyPlayer.rotation = 180;
				//RotateAroundCenter(MyPlayer, 180);
				this.rotation = 180;
				this.x -= Step;
				MoveRight = false;
			}
			
			//Rotaciones 45
			
			if( MoveDown == true && MoveRight == true )
			{
				//RotateAroundCenter(MyPlayer, 45 );
				this.rotation = 45;
				MoveUp = false;
				MoveLeft = false;
			}
			
			if( MoveDown == true && MoveLeft == true )
			{
				//RotateAroundCenter(MyPlayer, 135 );
				this.rotation = 135;
				MoveUp = false;
				MoveRight = false;
			}
			
			if( MoveLeft == true && MoveUp == true)
			{
				//RotateAroundCenter(MyPlayer, 225 );
				this.rotation = 225;
				MoveRight = false;
				MoveDown = false;
			}
			
			if( MoveUp == true && MoveRight == true)
			{
				//RotateAroundCenter(MyPlayer, 315 );
				this.rotation = 315;
				MoveDown = false;
				MoveLeft = false;
			}
			
		}
		
		public function RotateAroundCenter(obj:Object, rotation:Number):void
		{
			
			var bound:Rectangle = new Rectangle();
			// get the bounded rectangle of objects
			bound = obj.getRect(this);
			
			// calculate mid poits
			var midx1:Number = bound.x + bound.width/2;
			var midy1:Number = bound.y + bound.height/2;
			
			// assign the rotation
			obj.rotation = rotation;
			
			// assign the previous mid point as (x,y)
			obj.x = midx1;
			obj.y = midy1;
			
			// get the new bounded rectangle of objects
			bound = obj.getRect(this);
			
			// calculate new mid points
			var midx2:Number = bound.x + bound.width/2;
			var midy2:Number = bound.y + bound.height/2;
			
			// calculate differnece between the current mid and (x,y) and subtract
			//it to position the object in the previous bound.
			var diff:Number = midx2 - obj.x;
			obj.x -= diff;
			diff = midy2 - obj.y;
			obj.y -= diff;
		}
		
		public function IsDead():Boolean
		{
			if( HP >= 0 )
			{
				return false;
			}else return true;
		}
		
		public function getHP():int
		{
			return HP;
		}
	}
}