package  {

	import flash.display.Sprite;

	public class Inventory extends Sprite {
		
		private var _itemsInside:Array;
		
		public function Inventory(){
			
			this._itemsInside = [];
		}
		
		//Draws the inventory
		public function makeInventory():void{
			var currentItem: int = 0;
			for each (var item:Item in this._itemsInside){
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
			this._itemsInside.push(item);
			this.makeInventory();
			
		}

		public function removeItem(item:Item):void{

			for each (var inventoryItem:Item in this._itemsInside){
				if (inventoryItem is Item){
					this._itemsInside.splice(this._itemsInside.indexOf(item), 1);
					if (item.stage) Main.instance.removeFromStage(item);
                    this.makeInventory();
                    break;
				}
			}

		}

		//Returns True if the item is in the inventory
		public function getCurrentItem(item:Item):Boolean{
			for each(var inventoryItem:Item in this._itemsInside){
				if (item.name == inventoryItem.name) return true;
			}
			return false;
		}

		public function get itemsInside():Array{
			return _itemsInside;
		}
	}
}
