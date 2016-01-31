package  {
	
	import flash.display.MovieClip;
	
	public class Level1 extends Level{

        private var pickaxe:Pickaxe;
		private var screwdriver:Screwdriver;
		private var switchButton:Switch;
		private var buttonStage1to2:ButtonStage;
		private var buttonStage1to4:ButtonStage;
		
		public function Level1(){
            this.pickaxe = new Pickaxe();
			this.screwdriver = new Screwdriver();
			this.buttonStage1to2 = new ButtonStage();
			this.buttonStage1to4 = new ButtonStage();
			this.switchButton = new Switch();
		}		
		
		override public function loadStage():void {
            MovieClip(this.parent).gotoAndStop(2);
            if (!Main.instance.getInventory().visible) Main.instance.getInventory().visible = true;
            Main.instance.addToStage(this.switchButton, 230.45, 151.75);
            Main.instance.addItemToClean(this.switchButton);

            if (!this.screwdriver.inInventory) Main.instance.addToStage(this.screwdriver, 293.55, 64.30);
            if (!this.pickaxe.inInventory) Main.instance.addToStage(this.pickaxe, 68, 115, 37.50, 75);

            Main.instance.addItemToClean(this.pickaxe);
            Main.instance.addItemToClean(this.screwdriver);
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
