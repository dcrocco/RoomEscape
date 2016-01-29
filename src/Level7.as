package  {
	
	public class Level7 extends Level {

		private var safe:Safe;
		private var isSafeOpen:Boolean;
		private var buttonStage7to8:ButtonStage;
        private var buttonStage7to3:ButtonStage;

		public function Level7(){
			
			this.safe = new Safe();
			this.isSafeOpen = false;
            this.buttonStage7to8 = new ButtonStage();
            this.buttonStage7to8.alpha = 0;
            this.buttonStage7to8.name = 'buttonStage7to8';
            this.buttonStage7to3 = new ButtonStage();
            this.buttonStage7to3.alpha = 0;
            this.buttonStage7to3.name = 'buttonStage7to3';

		}
		
		override public function loadStage():void{

            Main.instance.gotoAndStop(8);
            Main.instance.addToStage(safe, 200, 155);
			Main.instance.addItemToClean(safe);
            Main.instance.addToStage(buttonStage7to8, 180, 107.65, 103, 103);
            Main.instance.addItemToClean(buttonStage7to8);
            Main.instance.addToStage(buttonStage7to3, 0, 290, 600, 30);
            Main.instance.addItemToClean(buttonStage7to3);

		}
	}
	
}
