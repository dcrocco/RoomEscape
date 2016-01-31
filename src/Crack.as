package  {
import flash.events.MouseEvent;

public class Crack extends StageItem {

	private var broken:Boolean;

	public function Crack() {
		addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true);
		this.broken = false;
	}

	private function clickHandler(event:MouseEvent):void {
        if (!this.broken && Main.instance.itemSelected is Pickaxe) {
            this.play();
            this.broken = true;
            var level:Level3 = Level3(Main.instance.getLevelFromList('Level3'));
            if (level) level.crackOpen = true;
        }
    }
}
}