package  {
import flash.display.MovieClip;

public class Level4 extends Level{

		private var buttonStage4to1:ButtonStage;
		private var buttonStage4to3:ButtonStage;
		private var shelf:Shelf;
		private var picturePaper:PicturePaper;
		
		public function Level4(){
			this.buttonStage4to1 = new ButtonStage();
			this.buttonStage4to3 = new ButtonStage();	
			this.shelf = new Shelf();
			this.picturePaper = new PicturePaper();
		}		
		
		override public function loadStage():void{
			MovieClip(this.parent).gotoAndStop(5);
			if (!this.picturePaper.inInventory){
				Main.instance.addToStage(this.picturePaper, 379.95, 193.60);
				Main.instance.addItemToClean(this.picturePaper);
			}	
			
			Main.instance.addToStage(this.shelf, 442.9, 144.05);
			Main.instance.addItemToClean(this.shelf);			
			this.loadButtons();
		}
		
		private function loadButtons():void{
			this.buttonStage4to1.name = 'buttonStage4to1';
			Main.instance.addToStage(this.buttonStage4to1, 581.95, 0);
			Main.instance.addItemToClean(this.buttonStage4to1);	
			
			this.buttonStage4to3.name = 'buttonStage4to3';
			Main.instance.addToStage(this.buttonStage4to3, 0, 0);			
			Main.instance.addItemToClean(this.buttonStage4to3);				
		}
	}
	
}
