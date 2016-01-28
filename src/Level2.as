package  {

	public class Level2 extends Level{
		
		private var gridOpen:Boolean;
		private var openGrid:OpenGrid;
		private var grid:Grid;
		private var buttonZoomGrid:ButtonStage;
		private var buttonStage2to3:ButtonStage;
		private var buttonStage2to1:ButtonStage;
		
		public function Level2(){
			this.grid = new Grid();
			this.openGrid = new OpenGrid();
			this.gridOpen = false;
			this.buttonZoomGrid = new ButtonStage();
			this.buttonStage2to3 = new ButtonStage();
			this.buttonStage2to1 = new ButtonStage();
		}
		
		override public function loadStage():void{
			
			Main.instance.gotoAndStop(3);
			if (!this.gridOpen){
				var level:Level5 = Level5(Main.instance.getLevelFromList('Level5'));
				if (level.checkScrewsQuantity() <= 1) this.gridOpen = true;
			}
			
			if (!this.gridOpen){
				
				Main.instance.addToStage(grid, 293.55, 64.30);
				Main.instance.addItemToClean(this.grid);
			}else{
				
				Main.instance.addToStage(openGrid, 312.75, 126.35);
				Main.instance.addItemToClean(this.openGrid);				
			}
			
			this.loadButtons();
		}

		private function loadButtons():void{
	
			this.buttonZoomGrid.alpha = 0;
			this.buttonZoomGrid.name = 'buttonStage2to5';			
			Main.instance.addToStage(this.buttonZoomGrid, 229.55, 41.40, 123, 45.80);
			Main.instance.addItemToClean(this.buttonZoomGrid);	
			
			this.buttonStage2to3.name = 'buttonStage2to3';
			Main.instance.addToStage(this.buttonStage2to3, 581.95, 0);
			Main.instance.addItemToClean(this.buttonStage2to3);
			
			this.buttonStage2to1.name = 'buttonStage2to1';
			Main.instance.addToStage(this.buttonStage2to1, 0, 0);
			Main.instance.addItemToClean(this.buttonStage2to1);	
			
		}
	
		
	}
	
}
