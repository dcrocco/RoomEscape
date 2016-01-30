package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class PictureButton extends MovieClip {
		
		public var movedPicture:Boolean;
		
		public function PictureButton() {
			this.movedPicture = false;			
			this.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
		}
		
		private function handleClick(e:MouseEvent):void{
			for(var i:int = 0; i < Main.instance.numChildren;i++){
				if(Main.instance.getChildAt(i) is Picture){
					Main.instance.getChildAt(i).x += 163;
					this.movedPicture=true;
				}
			}
			this.visible = false;
		}
	}
	
}
