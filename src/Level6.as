package  {

	public class Level6 extends Level{
		
		private var screw4:Screw;

		public function Level6(){
			
			this.screw4 = new Screw();
			this.screw4.name = 'screw4';
			
		}		

		
		override public function loadStage():void{
			if (screw4.isAttached){
				Main.instance.addToStage(screw4, 499, 22);
				Main.instance.addItemToClean(screw4);			
			}
			
			Main.instance.gotoAndStop(7);

		}
		
	}
	
}
