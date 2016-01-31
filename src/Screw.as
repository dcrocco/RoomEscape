package{

import flash.events.MouseEvent;

public class Screw extends StageItem{

		public var isAttached:Boolean;

		public function Screw() {
			this.isAttached = true;
			this.addEventListener(MouseEvent.CLICK, removeScrew, false, 0, true)
		}

        // Remove the screw and add it to the stageItemContainer
		public function removeScrew(e:MouseEvent):void{

			if (this.isAttached){
				if (Main.instance.itemSelected is Screwdriver){
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
	
}
