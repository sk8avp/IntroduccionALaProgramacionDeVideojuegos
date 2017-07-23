package MyClases
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class InGame extends Sprite
	{
		
		[Embed(source="Assets/Floor1.png")]
		private var Floor:Class;
		private var TileFloorOne:Bitmap = new Floor; 
		
		[Embed(source="Assets/Floor2.png")]
		private var FloorTwo:Class;
		private var TileFloorTwo:Bitmap = new FloorTwo; 
		
		[Embed(source="Assets/Floor3.png")]
		private var FloorThree:Class;
		private var TileFloorThree:Bitmap = new FloorThree; 
		
		protected var MyFloor:Vector.<Bitmap> = new Vector.<Bitmap>;
		
		private var MyPlayer:Player = new Player();
		
		public function InGame()
		{
			
			// Genero aleatoriamente el floor
			var randNumber:int;
			var TempBitmap:Bitmap = new Bitmap;
			
			for(var i:uint = 0; i < 50; i++) // Columnas
			{
				for(var c:uint = 0; c < 32; c++) // Filas
				{
					randNumber = Math.random() * 3;
					TempBitmap.x = i * 16;
					TempBitmap.y = c * 16;

					switch (randNumber)
					{
						case 0:
							TempBitmap = new Floor;
							break;
						case 1:
							TempBitmap = new FloorTwo;
							break;
						case 2:
							TempBitmap = new FloorThree;
							break;
					}
					MyFloor.push(TempBitmap);
				}
			}
			
			// Añado todos los tiles a la lista de visualizacion
			for(i = 0; i < MyFloor.length; i++)
			{
				addChild( MyFloor[i] );
			}
			
			addChild( MyPlayer );
		}
		
		public function ProcessPlayerMoves(event:KeyboardEvent):void
		{
			
			if( event.keyCode == Keyboard.W || event.keyCode == Keyboard.UP )
			{
				MyPlayer.MovePlayerUp();
			}
			
			if( event.keyCode == Keyboard.A || event.keyCode == Keyboard.RIGHT )
			{
				MyPlayer.MovePlayerRight();
			}
			
			if( event.keyCode == Keyboard.S || event.keyCode == Keyboard.DOWN )
			{
				MyPlayer.MovePlayerDown();
			}
			
			if( event.keyCode == Keyboard.D || event.keyCode == Keyboard.LEFT )
			{
				MyPlayer.MovePlayerLeft();
			}
			
			MyPlayer.DoMove();
			
		}
		
		public function StopProcessPlayerMoves(event:KeyboardEvent):void
		{
			if( event.keyCode == Keyboard.W || event.keyCode == Keyboard.UP )
			{
				MyPlayer.StopMovingPlayerUp();
			}
			
			if( event.keyCode == Keyboard.A || event.keyCode == Keyboard.RIGHT )
			{
				MyPlayer.StopMovingPlayerRight();
			}
			
			if( event.keyCode == Keyboard.S || event.keyCode == Keyboard.DOWN )
			{
				MyPlayer.StopMovingPlayerDown();
			}
			
			if( event.keyCode == Keyboard.D || event.keyCode == Keyboard.LEFT )
			{
				MyPlayer.StopMovingPlayerLeft();
			}
		}
	}
}