package {
import flash.events.MouseEvent;
import flash.text.TextField;

public class SafePaper extends Item{

    private var safePapers:Array;
    private var number:int;
    private var left:Boolean;
    private var text:TextField;

    public function SafePaper() {
        this.safePapers = [];
        this.number = (Math.round(Math.random()* (100-1) + 1));
//        this.text = new TextField();
//        this.text.text = this.number.toString();
//        this.text.width = this.width;
//        this.text.height = this.height;
//        this.text.x = (this.x+(Math.round((text.width - text.textWidth)/2)));
//        this.text.y = (this.y-(Math.round((text.height - text.textHeight) / 2)));
//        this.text.textColor = 0xFFFFFF;
//        this.addChild(this.text);
    }

    override protected function stage_mouseUpHandler(event:MouseEvent):void {
        removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        stopDrag();
        if (dropTarget){

            if (dropTarget.parent is SafePaper){
                var totalSafePapers:int = 0;

                for each(var item:Item in Main.instance.getInventory().itemsInside ){
                    if (item is SafePaper){
                        totalSafePapers++;
                        this.safePapers.push(item);
                    }
                }

                if (totalSafePapers == 3){
                    for each (var safePaper:SafePaper in this.safePapers){
                        this.combineWith(safePaper);
                    }
                }

                this.safePapers = [];
            }

            else if (dropTarget.parent is Item){
                this.combineWith(Item(dropTarget.parent));
            }
        }

        x = this.originalPosition.x;
        y = this.originalPosition.y;
    }

    override protected function combineWith(item:Item):void{

        if (item is SafePaper) Main.instance.getInventory().removeItem(item);
        else super.combineWith(item);

    }

}
}
