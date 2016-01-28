package  {
	
	import flash.display.MovieClip;
	import mx.core.ButtonAsset;
	
	public class Level3 extends Level{
		
		private var picture:Picture;
		private var safe:Safe;
		private var pictureButton:PictureButton;
		private var buttonStage3to4:ButtonStage;
		private var buttonStage3to2:ButtonStage;
		private var buttonStage3to7:ButtonStage;
		
		public function Level3(){
			this.picture = new Picture();
			this.safe = new Safe();
			this.pictureButton = new PictureButton();
			this.buttonStage3to4 = new ButtonStage();
			this.buttonStage3to2 = new ButtonStage();
			this.buttonStage3to7 = new ButtonStage();
			this.buttonStage3to7.name = 'buttonStage3to7';
			this.buttonStage3to7.alpha = 0;
		}		
		
		override public function loadStage():void{
			
			MovieClip(this.parent).gotoAndStop(4);	

			Main.instance.addToStage(this.safe, 162, 130, 123.60, 92.10);
			Main.instance.addItemToClean(this.safe);	
			Main.instance.addToStage(this.buttonStage3to7, 100.2, 83.95, 123.60, 92.10);
			Main.instance.addItemToClean(this.buttonStage3to7);						
			
			if (!this.pictureButton.movedPicture){
				

				Main.instance.addToStage(this.picture, 165, 126.5);
				Main.instance.addToStage(this.pictureButton, 141.45, 175.60);
				Main.instance.addItemToClean(this.pictureButton);
				
			}else{
				
				Main.instance.addToStage(picture, 328, 126.5);				
			}
			
			Main.instance.addItemToClean(this.picture);			
			this.loadButtons();
		}
		
		private function loadButtons():void{
			this.buttonStage3to4.name = 'buttonStage3to4';
			Main.instance.addToStage(this.buttonStage3to4, 581.95, 0);
			Main.instance.addItemToClean(this.buttonStage3to4);	
			
			this.buttonStage3to2.name = 'buttonStage3to2';
			Main.instance.addToStage(this.buttonStage3to2, 0, 0);			
			Main.instance.addItemToClean(this.buttonStage3to2);			
		}
		
	}
	
}
