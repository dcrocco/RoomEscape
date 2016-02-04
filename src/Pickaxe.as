package {
import flash.events.MouseEvent;

public class Pickaxe extends Item{

    public function Pickaxe() {
    }

    override protected function stage_mouseUpHandler(event:MouseEvent):void {
        removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        stopDrag();
        if (dropTarget){

            if (dropTarget.parent is Crack){

                Crack(dropTarget.parent).breakCrack();
            }
        }

        if (dropTarget.parent is Item){
            this.combineWith(Item(dropTarget.parent));
        }

        x = this.originalPosition.x;
        y = this.originalPosition.y;
    }

}
}
