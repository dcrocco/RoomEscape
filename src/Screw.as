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
				for each (var item:Item in Main.instance.getInventory().itemsInside){
					if (item is Screwdriver && Main.instance.itemSelected is Screwdriver){
						if (this.name == 'screw4'){
							break;
						}else{
							this.isAttached = false;
							this.visible = false;
							Main.instance.playLevel(5);
							break;
						}
					}
				}
			}
		}



	}
	
}
