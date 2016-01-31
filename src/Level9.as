package {

public class Level9 extends Level {

    private var crack:Crack;
    private var buttonStage9to3:ButtonStage;

    public function Level9() {

        this.crack = new Crack();
        this.buttonStage9to3 = new ButtonStage();
    }

    override public function loadStage():void{

        Main.instance.gotoAndStop(10);
        Main.instance.addToStage(this.crack, 467, 145.50);
        Main.instance.addItemToClean(this.crack);
        this.loadButtons();
    }

    private function loadButtons():void {

        this.buttonStage9to3.name = 'buttonStage9to3';
        this.buttonStage9to3.alpha = 0;
        Main.instance.addToStage(this.buttonStage9to3, 0, 300, 600, 22);
        Main.instance.addItemToClean(this.buttonStage9to3);
    }


}
}
