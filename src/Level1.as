package  {
	
	import flash.display.MovieClip;
	
	public class Level1 extends Level{
		
		private var screwdriver:Screwdriver;
		private var buttonStage1to2:ButtonStage;
		private var buttonStage1to4:ButtonStage;
		
		public function Level1(){
			this.screwdriver = new Screwdriver();
			this.buttonStage1to2 = new ButtonStage();
			this.buttonStage1to4 = new ButtonStage();
		}		
		
		override public function loadStage():void {
			MovieClip(this.parent).gotoAndStop(2);
			if (!Main.instance.getInventory().visible) Main.instance.getInventory().visible = true;
			if (!this.screwdriver.inInventory){
				
				Main.instance.addToStage(this.screwdriver, 293.55, 64.30);
				Main.instance.addItemToClean(this.screwdriver);				
			}
			this.loadButtons();
		}
		
		
		private function loadButtons():void{

			this.buttonStage1to2.name = 'buttonStage1to2';
			Main.instance.addToStage(this.buttonStage1to2, 581.95, 0);
			Main.instance.addItemToClean(this.buttonStage1to2);	

			this.buttonStage1to4.name = 'buttonStage1to4';
			Main.instance.addToStage(this.buttonStage1to4, 0, 0);
			Main.instance.addItemToClean(this.buttonStage1to4);	
			
		}		
		
	}
	
}
