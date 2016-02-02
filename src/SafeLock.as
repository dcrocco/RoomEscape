package  {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class SafeLock extends StageItem {

    private var myTimer:Timer;
    private var isLocked:Boolean;
    private var comb1:int;
    private var comb2:int;
    private var comb3:int;
    private var comb1open:Boolean;
    private var comb2open:Boolean;
    private var actualPosition:int;

    public function SafeLock() {
        this.isLocked = true;
        this.myTimer = new Timer(50);
        addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0 ,true);
        addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0 ,true);
        addEventListener(MouseEvent.CLICK, handleClick, false, 0 ,true);
        addEventListener(MouseEvent.MOUSE_OUT, onUp, false, 0 , true);
        this.myTimer.addEventListener(TimerEvent.TIMER, handleClick, false, 0 ,true);
        this.comb1 = 1;
        this.comb2 = -1;
        this.comb3 = 2;
    }

    //Timers to continue rotating the
    private function onDown(e:MouseEvent):void {
        this.myTimer.start();
    }

    private function onUp(e:MouseEvent):void {
        this.myTimer.stop();
    }

    // Function to check the lock combination and reset in case that its wrong.
    private function checkLock():void{

        if (!comb1open){
            if (this.actualPosition == this.comb1) this.comb1open=true;
        }
        else if (comb1open && !comb2open){
            if (this.actualPosition > this.comb1) this.comb1open = false;
            if (this.actualPosition == this.comb2) this.comb2open=true;
        }
        else{

            if (this.actualPosition < this.comb2){
                this.comb2open = false;
                this.comb1open = false;
            }
            if (this.actualPosition == this.comb3){
                this.isLocked = false;
            }

        }

    }

    //Click handler for the lock.
    private function handleClick(event:Event):void{

        if (isLocked){

            //If Mouse is clicking the stageItem
            if(this.hitTestPoint(stage.mouseX ,stage.mouseY, true)){

                //If the click is inside the circle
                if (Math.sqrt((stage.mouseX - this.x)*(stage.mouseX - this.x) +
                                (stage.mouseY - this.y)*(stage.mouseY - this.y)) < (this.width/2)){

                    //If the click is on left side of the circle else is on right
                    if(stage.mouseX < this.x){
                        this.rotation += 3.6;
                        this.actualPosition--;
                    }else{
                        this.rotation -= 3.6;
                        this.actualPosition++;
                    }

                }
            }

            if(Math.round(this.rotation) == 0) this.actualPosition = 0;
            checkLock();

        }

    }
}
}
