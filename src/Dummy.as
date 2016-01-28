package  {
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	public class Dummy extends Sprite {
		
		private var dummyItem:Item;
		private var realItem:Item;

		public function Dummy(item:Item, realItem:Item):void{
			this.dummyItem = item;
			this.realItem = realItem;
			this.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
		}
		
	
		public function openWindow():void{
			this.graphics.beginFill(0x663300, 0.25);
			this.graphics.drawRect(0, 0, Main.instance.width, Main.instance.height)
			this.graphics.endFill();
			Main.instance.addToStage(this, this.x, this.y)
			Main.instance.addToStage(this.dummyItem, 75, 161, 450, 280);
			this.dummyItem.removeClickListener();
			
		}
		
		public function handleClick(e:MouseEvent):void{
			if (this.stage && this.dummyItem.stage){
				Main.instance.removeFromStage(this);
				Main.instance.removeFromStage(this.dummyItem);				
			}
			this.realItem.readableWindowOpen = false;
		}

		
	}
	
}
