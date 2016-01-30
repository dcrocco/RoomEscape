package  {

	public class Level5 extends Level{

		private var screw1:Screw;
		private var screw2:Screw;
		private var screw3:Screw;
		private var screw4:Screw;
		private var buttonStage5to2:ButtonStage;
		
		public function Level5(){
			this.buttonStage5to2 = new ButtonStage();
			
			this.screw1 = new Screw();
			this.screw1.name = 'screw1';
			
			this.screw2 = new Screw();
			this.screw2.name = 'screw2';
			
			this.screw3 = new Screw();
			this.screw3.name = 'screw3';

			this.screw4 = new Screw();
			this.screw4.name = 'screw4';
			
		}		

		override public function loadStage():void{
			
			if (this.checkScrewsQuantity() <= 1){
				Main.instance.gotoAndStop(7);
			}else Main.instance.gotoAndStop(6);
			
			if (screw1.isAttached){
				Main.instance.addToStage(screw1, 105, 56);
				Main.instance.addItemToClean(screw1);
			}
			if (screw2.isAttached){
				Main.instance.addToStage(screw2, 501, 56);
				Main.instance.addItemToClean(screw2);
			}	
			if (screw3.isAttached){
				Main.instance.addToStage(screw3, 105, 210);
				Main.instance.addItemToClean(screw3);
			}				
			if (screw4.isAttached){
				Main.instance.addToStage(screw4, 501, 210);
				Main.instance.addItemToClean(screw4);
			}
		
			this.loadButtons();
		}
		
		public function checkScrewsQuantity():int{
			var screwsQuantity:int = 4;
			if (!screw1.isAttached) screwsQuantity--;
			if (!screw2.isAttached) screwsQuantity--;
			if (!screw3.isAttached) screwsQuantity--;
			if (!screw4.isAttached) screwsQuantity--;
			return screwsQuantity;
		}
		
		private function loadButtons():void{

	     	this.buttonStage5to2.name = 'buttonStage5to2';
			Main.instance.addToStage(this.buttonStage5to2, 0, 303.95, 600, 18.05);
			Main.instance.addItemToClean(this.buttonStage5to2);				
		}
	}
	
}
