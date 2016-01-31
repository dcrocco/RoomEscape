package  {
	
	public class Level3 extends Level{
		
		private var picture:Picture;
		private var safe:Safe;
		private var pictureButton:PictureButton;
        public var crackOpen:Boolean;
        private var crack:Crack;
		private var buttonStage3to4:ButtonStage;
		private var buttonStage3to2:ButtonStage;
		private var buttonStage3to7:ButtonStage;
		private var buttonStage3to9:ButtonStage;

		public function Level3(){
			this.picture = new Picture();
			this.safe = new Safe();
            this.crackOpen = false;
            this.crack = new Crack();
			this.pictureButton = new PictureButton();
			this.buttonStage3to4 = new ButtonStage();
			this.buttonStage3to2 = new ButtonStage();
			this.buttonStage3to7 = new ButtonStage();
			this.buttonStage3to9 = new ButtonStage();
		}		
		
		override public function loadStage():void{
			
			Main.instance.gotoAndStop(4);

			Main.instance.addToStage(this.safe, 152, 160.5, 100, 74.62);
			Main.instance.addItemToClean(this.safe);
			Main.instance.addToStage(this.buttonStage3to7, 100.2, 83.95, 123.60, 92.10);
			Main.instance.addItemToClean(this.buttonStage3to7);						
			
			if (!this.pictureButton.movedPicture){

				Main.instance.addToStage(this.picture, 145, 157);
				Main.instance.addToStage(this.pictureButton, 121.45, 206.10);
				Main.instance.addItemToClean(this.pictureButton);

			}else{

				Main.instance.addToStage(picture, 308, 157);
			}

            if(this.crackOpen) this.crack.gotoAndStop(64);

            Main.instance.addToStage(this.crack, 534.40, 238, 33, 34);
            Main.instance.addItemToClean(this.crack);
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

			this.buttonStage3to7.name = 'buttonStage3to7';
			this.buttonStage3to7.alpha = 0;

			this.buttonStage3to9.name = 'buttonStage3to9';
			this.buttonStage3to9.alpha = 0;
			Main.instance.addToStage(this.buttonStage3to9, 530.10, 225.05, 43, 43);
			Main.instance.addItemToClean(this.buttonStage3to9);

		}
		
	}
	
}
