package  {
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	
	public class Main extends MovieClip {

		//Global vars
		public var lastClicked:Object;   //TODO: Add getter
		public var itemSelected:Item;	 //TODO: Add getter	
		private var myInventory:Inventory;
		private var levelArray:Array;
		private var itemsToClean:Array;
		
		//Singleton
		private static var _instance:Main;
		public static function get instance():Main{return _instance;}

		//Main constructor, initialize Arrays, Inventory, Stages quantity and Singleton to reference
		public function Main() {
			_instance = this;
			this.itemsToClean = [];
			this.levelArray = [];
			this.initializeStages(7);
			this.makeInventory();
		}

		//Initialization of the inventory.
		private function makeInventory():void{
			this.myInventory = new Inventory();
			addChild(myInventory);
			this.myInventory.x = 5;
			this.myInventory.y = 347;
		}
		
		/**Create the amounts of stages needed and put them in an array.
		@param stagesQuantity: Quantity of stages wanted.
		Warning! needs a class for each level.*/
		private function initializeStages(stagesQuantity:int):void{
			
			for (var i:int = 1; i <= stagesQuantity; i++){
				var levelName:String = "Level"+i;
				var levelRef:Class = Class(getDefinitionByName(levelName));
				var level:Level = new levelRef();
				this.levelArray.push(level);
			}
		}
	
		//--------------- GETTERS SECTION ----------------------//
		
		//Returns the inventory.
		public function getInventory():Inventory{
			return this.myInventory;
		}
		
		//Return "levelRequired" from the level array list.
		public function getLevelFromList(levelRequired:String):Level{
			
			var levelRef:Class = Class(getDefinitionByName(levelRequired));
			var level:Level = null;
			for each (var levelToFind:Level in this.levelArray){
				if (levelToFind is levelRef){
					level = levelToFind;
					break;
				}
			}

			return level;
		}
		
		//--------------- END OF GETTERS SECTION ----------------------//
		
		
		//--------------- SETTERS SECTION ----------------------//
		
		//Set an item as the selected one
		public function setItemSelected(item:Item):void{

			if (this.itemSelected) this.itemSelected = null;
			this.itemSelected = item;
		}

		//Add an item (stage or inventory) to the itemsToClean Array
		public function addItemToClean(item:Sprite):void{
			this.itemsToClean.push(item);
		}
		
		//--------------- END OF SETTERS SECTION ----------------------//
		
	
		//Adds to stage the displayObject
		public function addToStage(displayObject:DisplayObject, posX:Number, posY:Number,
		objWidth:Number=0, objHeight:Number=0):void{
			
			if (objWidth) displayObject.width = objWidth;
			if (objHeight) displayObject.height = objHeight;
			displayObject.x = posX;
			displayObject.y = posY;
			
			addChild(displayObject);
		}
		
		//Removes from the stage the displayObject
		public function removeFromStage(displayObject:DisplayObject):void{
			removeChild(displayObject);
		}	
		
		//Clean from the stage the items in itemsToClean Array
		public function cleanStage():void{
			
			for each(var item:Sprite in this.itemsToClean){
				if(item is Item){
					if (Item(item).inInventory) continue;
				}
				removeChild(item);
			}
			this.itemsToClean = [];
		}		
		
		//Plays the levelNumber (Should be in the levelArray)
		public function playLevel(levelNumber:int):void{
			
			var levelName:String = "Level"+levelNumber;
			var levelRef:Class = getDefinitionByName(levelName) as Class;
			
			for each(var level:Level in levelArray){
				if (level is levelRef){
					addChild(level);
					this.cleanStage();
					level.loadStage();
					removeChild(level);
				}
			}
		}
	
		
	}
}
