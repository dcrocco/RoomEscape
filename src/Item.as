package  {
	
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
	public class Item extends Sprite {
		
		public var inInventory:Boolean;
		public var readeable:Boolean;
		public var readableWindowOpen:Boolean;
		private var glow:GlowFilter;
		protected function combineWith(item:Item):void{
			
		}

		public function Item():void{
			this.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
			this.glow = new GlowFilter(0xfffffff, 1, 5, 5, 5, 1, false, false);
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
		public function handleClick(e:MouseEvent):void{
			
			if (!this.inInventory) Main.instance.getInventory().addNewItem(this);
			
			else if (!this.readeable){
				if (Main.instance.itemSelected == this){
					Main.instance.setItemSelected(null);
					this.filters = [];
				}else{
					Main.instance.setItemSelected(this);
					this.filters = [glow]
				}
			}else if (!this.readableWindowOpen) this.OpenReadableWindow();
		}
	
		
		private function OpenReadableWindow():void{
			
			var className:String = getQualifiedClassName(this);
			var newItemClass:Class = getDefinitionByName(className) as Class;
			var newItem:Object  = new newItemClass();
			
			var dummy:Dummy = new Dummy(Item(newItem), this);
			dummy.openWindow();
			this.readableWindowOpen = true;
		}
	}
	
}
