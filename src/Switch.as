package  {
import flash.events.MouseEvent;

public class Switch extends StageItem {

    public function Switch() {
        addEventListener(MouseEvent.CLICK, turnLight, false, 0, true);
    }

    private function turnLight(e:MouseEvent){

        Main.instance.changeIllumination();
    }
}
}
