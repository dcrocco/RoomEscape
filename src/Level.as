package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	public class Level extends MovieClip{
			
		protected var cleanItems:Array;
		
		public function Level(){
			this.cleanItems = [];
		}
		
		public function loadStage():void{
			
		}
		
		public function addItemToClean(itemToClean:Sprite):void{
			this.cleanItems.push(itemToClean);
		}
	
		
	}
	
}
