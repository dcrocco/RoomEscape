package  {

	import flash.display.Sprite;

	public class Inventory extends Sprite {
		
		public var itemsInside:Array;
		
		public function Inventory(){
			
			this.itemsInside = [];
		}
		
		//Draws the inventory
		public function makeInventory():void{
			var currentItem: int = 0;
			for each (var item:Item in this.itemsInside){
				item.width = 35;
				item.height = 35;
				item.x = (this.x+7.5) + (5*currentItem) + (currentItem * 40);
				item.y = this.y;
				currentItem+=1;
			}

		}		
		
		//Add item to the inventory and re-draw it
		public function addNewItem(item:Item):void{
			item.inInventory = true;
			this.itemsInside.push(item);
			this.makeInventory();
			
		}
		
		//Returns True if the item is in the inventory
		public function getCurrentItem(item:Item):Boolean{
			for each(var inventoryItem:Item in this.itemsInside){
				if (item.name == inventoryItem.name) return true;
			}
			return false;
		}
	
	}
}
