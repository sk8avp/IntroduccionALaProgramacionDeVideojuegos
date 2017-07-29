package MyClases
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class Enemy extends Sprite
	{
		
		[Embed(source="Assets/Enemy.png")]
		private var AEnemy:Class;
		private var MyEnemy:Bitmap = new AEnemy;
		
		private var Step:uint = 2;
		
		private var Damage:int = 1;
		
		public function Enemy()
		{
			
			/*Creo un rand de 0 a 3 siendo:
			
			0- Arriba
			1- Derecha
			2- Abajo
			3- Izquierda 
			
			*/
			
			var randNumber:int;
			randNumber = Math.random() * 3;
			switch(randNumber)
			{
				// Arriba (Genero y = -50, x random)
				case 0:
					MyEnemy.y = -50;
					MyEnemy.x = Math.random() * 800;
					break;
				
				// Derecha (Genero x = 850, y random)
				case 1:
					MyEnemy.x = 850;
					MyEnemy.y = Math.random() * 512;
					break;
				
				// Abajo (Genero y = 562, x random)
				case 2:
					MyEnemy.y = 562;
					MyEnemy.x = Math.random() * 800;
					break;
				
				// Izquierda (Genero x = -50, y random) 
				case 3:
					MyEnemy.x = -50;
					MyEnemy.y = Math.random() * 512;
					break;
			}
			
			MyEnemy.scaleX = 0.2;
			MyEnemy.scaleY = 0.2;
			
			addChild( MyEnemy );
			
		}
		
		public function getDamage():int
		{
			return Damage;
		}
		
		public function GoToPlayer(PosX:int, PosY:int):void
		{
			if( MyEnemy.x <= PosX )
			{
				MyEnemy.x += Step;
			}
			
			if( MyEnemy.y <= PosY )
			{
				MyEnemy.y += Step;
			}
			
			if( MyEnemy.x >= PosX )
			{
				MyEnemy.x -= Step;
			}
			
			if( MyEnemy.y >= PosY )
			{
				MyEnemy.y -= Step;
			}
			
			/*
			var Rotation:int = GetOrientation(PosX, PosY);
			switch(Rotation)
			{
				case 0:
					MyEnemy.rotation = 315;
					break;
				case 1:
					MyEnemy.rotation = 0;
					break;
				case 2:
					MyEnemy.rotation = 45;
					break;
				case 3:
					MyEnemy.rotation = 90;
					break;
				case 4:
					MyEnemy.rotation = 135;
					break;
				case 5:
					MyEnemy.rotation = 180;
					break;
				case 6:
					MyEnemy.rotation = 225;
					break;
				case 7:
					MyEnemy.rotation = 270;
					break;
			}
			*/
			
		}
		
		private function GetOrientation(PosX:int, PosY:int):int
		{
			
			if( PosX < MyEnemy.x && PosY < MyEnemy.y )
			{
				return 6;
			}
			
			if( PosX < MyEnemy.x && PosY > MyEnemy.y )
			{
				return 4;
			}
			
			if( PosX > MyEnemy.x && PosY < MyEnemy.y )
			{
				return 0;
			}
			
			if( PosX > MyEnemy.x && PosY > MyEnemy.y )
			{
				return 2;
			}
			
			if( PosX == MyEnemy.x && PosY < MyEnemy.y )
			{
				return 5;
			}
			
			if( PosX == MyEnemy.x && PosY > MyEnemy.y )
			{
				return 7;
			}
			
			if( PosX < MyEnemy.x && PosY == MyEnemy.y )
			{
				return 5;
			}
			
			if( PosX > MyEnemy.x && PosY == MyEnemy.y )
			{
				return 1;
			}
			
			return 0;
		}
		
	}
}