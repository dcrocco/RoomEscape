package{

public class Screw extends StageItem{

		public var isAttached:Boolean;

		public function Screw() {
			this.isAttached = true;
		}

        // Remove the screw and add it to the stageItemContainer
		public function removeScrew():void{

			if (this.isAttached){
				if (this.name == 'screw4'){
					return;
				}else{
					this.isAttached = false;
					this.visible = false;
					Main.instance.playLevel(5);
				}
			}
		}



	}
	
}
