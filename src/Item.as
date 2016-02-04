package  {
	
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.utils.getQualifiedClassName;
import flash.utils.getDefinitionByName;
	
public class Item extends Sprite {

    public var inInventory:Boolean;
    public var readeable:Boolean;
    public var readableWindowOpen:Boolean;
    protected var originalPosition:Point;


    protected function combineWith(item:Item):void{

       trace("YOU CANT COMBINE THESE ITEMS")

    }


    public function Item():void{

        this.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }

    public function unselectItem():void{
        this.filters = []
    }

    public function removeClickListener():void{
        this.removeEventListener(MouseEvent.CLICK, handleClick)
    }

    /** Checks what to do with the clicked item.
    @param MouseEvent: Click Event.
    **/
    protected function handleClick(e:MouseEvent):void{

        if (!this.inInventory) Main.instance.getInventory().addNewItem(this);

        else if (this.readeable && !this.readableWindowOpen){
            if (x == this.originalPosition.x && y == this.originalPosition.y) this.OpenReadableWindow();
            x = this.originalPosition.x;
            y = this.originalPosition.y;
        }

    }

    private function OpenReadableWindow():void{

        var className:String = getQualifiedClassName(this);
        var newItemClass:Class = getDefinitionByName(className) as Class;
        var newItem:Object  = new newItemClass();

        var dummy:Dummy = new Dummy(Item(newItem), this);
        dummy.openWindow();
        this.readableWindowOpen = true;
    }

    private function mouseDownHandler(event:MouseEvent):void {

        if (this.inInventory){
            this.originalPosition = new Point(x , y);
            Main.instance.setChildIndex(this, Main.instance.numChildren-1);
            startDrag();
            addEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        }

    }

    protected function stage_mouseUpHandler(event:MouseEvent):void {
        removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        stopDrag();
        if (dropTarget.parent is Item){
            this.combineWith(Item(dropTarget.parent));
        }
    }
}

}
