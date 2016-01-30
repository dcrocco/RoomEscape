package  {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class SafeLock extends StageItem {

    private var myTimer:Timer;

    public function SafeLock() {

        this.myTimer = new Timer(50);
        addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0 ,true);
        addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0 ,true);
        addEventListener(MouseEvent.CLICK, handleClick, false, 0 ,true);
        this.myTimer.addEventListener(TimerEvent.TIMER, handleClick, false, 0 ,true);

    }

    //Timers to continue rotating the
    private function onDown(e:MouseEvent):void {
        this.myTimer.start();
    }

    private function onUp(e:MouseEvent):void {
        this.myTimer.stop();
    }

    private function handleClick(event:Event):void{
        
        //If Mouse is clicking the stageItem
        if(this.hitTestPoint(stage.mouseX ,stage.mouseY, true)){

            //If the click is inside the circle
            if (Math.sqrt((stage.mouseX - this.x)*(stage.mouseX - this.x) +
                            (stage.mouseY - this.y)*(stage.mouseY - this.y)) < (this.width/2)){

                //If the click is on left side of the circle else is on right
                if(stage.mouseX < this.x) this.rotation += 3.6;
                else this.rotation -= 3.6;
            }
        }

    }
}
}
