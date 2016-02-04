package  {
import flash.events.MouseEvent;

public class Crack extends StageItem {

	private var broken:Boolean;

	public function Crack() {
		this.broken = false;
	}

	public function breakCrack():void {
        if (!this.broken) {
            this.play();
            this.broken = true;
            var level:Level3 = Level3(Main.instance.getLevelFromList('Level3'));
            if (level) level.crackOpen = true;
        }
    }
}
}