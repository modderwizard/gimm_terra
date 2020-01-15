package lib.terra.jonathan.scene6 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import lib.terra.ProgressManager;
	import lib.terra.StageManager;
	
	public class Scene6Inside extends MovieClip 
	{
		public function Scene6Inside() 
		{
			if(!ProgressManager.hasTakenVillagePowerCore)
			{
				this.theGenerator.addEventListener(TouchEvent.TOUCH_TAP, theGenerator_onTouchTap);
			}
			
			this.backButton.addEventListener(TouchEvent.TOUCH_TAP, backButton_onTouchTap);
			
			StageManager.setInterfaceVisible(true);
		}
		
		// Generator functions
		private function theGenerator_onTouchTap(evt:TouchEvent):void
		{
			this.theGenerator.removeEventListener(TouchEvent.TOUCH_TAP, theGenerator_onTouchTap);
			
			this.stage.addChild(new SceneGeneratorInteract());
			this.parent.removeChild(this);
		}
		
		// Back button functions
		private function backButton_onTouchTap(evt:TouchEvent):void
		{
			this.backButton.removeEventListener(TouchEvent.TOUCH_TAP, backButton_onTouchTap);
			
			this.stage.addChild(new PanelOverview());
			this.parent.removeChild(this);
		}
	}
}
