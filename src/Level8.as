package {

public class Level8 extends  Level{

    private var mirilla:SafeLock;
    private var buttonStage8to7:ButtonStage;

    public function Level8() {

        this.mirilla = new SafeLock();
        this.buttonStage8to7 = new ButtonStage();
        this.buttonStage8to7.name = 'buttonStage8to7';
        this.buttonStage8to7.alpha = 0;
    }

    override public function loadStage():void{

        Main.instance.gotoAndStop(9);
        Main.instance.addToStage(buttonStage8to7, 0, 350, 600, 22);
        Main.instance.addItemToClean(buttonStage8to7);
        Main.instance.addToStage(mirilla, 268.40, 186.60);
        Main.instance.addItemToClean(mirilla);

    }
}
}
