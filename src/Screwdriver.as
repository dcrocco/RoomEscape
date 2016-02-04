package  {
import flash.events.MouseEvent;

public class Screwdriver extends Item {
		
    public function Screwdriver() {
    }

    override protected function stage_mouseUpHandler(event:MouseEvent):void {
        removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        stopDrag();
        if (dropTarget){

            if (dropTarget.parent is Screw){

                Screw(dropTarget.parent).removeScrew();
            }

            else if (dropTarget.parent is Item){
                this.combineWith(Item(dropTarget.parent));
            }
        }

        x = this.originalPosition.x;
        y = this.originalPosition.y;
    }
}
}
