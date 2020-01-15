package lib.terra
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import lib.terra.ui.InterfaceContainer;
	
	public class StageManager extends MovieClip 
	{
		private static var instance:StageManager = null;
		
		private var interfaceContainer:InterfaceContainer = null;
		
		public function StageManager() 
		{
			StageManager.instance = this;
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// Add interface container
			this.interfaceContainer = new InterfaceContainer();
			this.stage.addChild(this.interfaceContainer);
			
			this.addEventListener(Event.ACTIVATE, onActivate);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			StageManager.setFuelPercentage(0);
			StageManager.setInterfaceVisible(false);
		}
		
		private function onActivate(evt:Event):void
		{
			this.removeEventListener(Event.ACTIVATE, onActivate);
			
			if(!Multitouch.supportsTouchEvents)
			{
				this.removeChildren();
				this.addChild(new ScreenUnsupportedDevice());
			}
		}
		
		private function onEnterFrame(evt:Event):void
		{
			this.stage.addChild(this.interfaceContainer);
		}
		
		// Static
		public static function toggleFuelbar():void
		{
			StageManager.instance.interfaceContainer.fuelBarContainer.fuelBar.onTouchTap(null);
		}
		
		public static function setFuelPercentage(percentage:int):void
		{
			StageManager.instance.interfaceContainer.fuelBarContainer.fuelBar.setFuelPercentage(percentage);
		}
		
		public static function getFuelPercentage():int
		{
			return StageManager.instance.interfaceContainer.fuelBarContainer.fuelBar.getFuelPercentage();
		}
		
		public static function setInterfaceVisible(isVisible:Boolean):void
		{
			StageManager.instance.interfaceContainer.fuelBarContainer.visible = isVisible;
		}
	}
}
