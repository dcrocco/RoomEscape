package  {
	
	public class Level7 extends Level {

		private var safe:Safe;
		private var isSafeOpen:Boolean;
		
		public function Level7(){
			
			this.safe = new Safe();
			this.isSafeOpen = false;
						
		}
		
		override public function loadStage():void{
			
			Main.instance.addToStage(safe, 200, 155);
			Main.instance.addItemToClean(safe);			
			Main.instance.gotoAndStop(8);

		}
	}
	
}
