package lib.terra.ui 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import lib.terra.ProgressManager;
	
	public class InterfaceDebug extends MovieClip 
	{
		public function InterfaceDebug() 
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(evt:Event):void
		{
			this.villageCoreText.visible = ProgressManager.hasTakenVillagePowerCore;
			this.damCoreText.visible = ProgressManager.hasTakenDamPowerCore;
		}
	}
}
