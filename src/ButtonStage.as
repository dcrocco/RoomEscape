package  {
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class ButtonStage extends Sprite {
		
		public function ButtonStage(){
			this.addEventListener(MouseEvent.CLICK, playStage, false, 0 ,true);
		}
		
		public function playStage(e:MouseEvent):void{
			var level:int = int(this.name.substr(this.name.length-1, this.name.length));
			Main.instance.playLevel(level);
		}
			
	}
	
}
