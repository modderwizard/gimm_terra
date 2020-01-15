package lib.terra.ui
{
	import flash.events.Event;
	
	public class DialogBoxEvent extends Event
	{
		public function DialogBoxEvent(eventType:String)
		{
			super(eventType, false, false);
		}
		
		public static const FINISHED:String = "dialogBoxFinished";
		public static const NEXT_DIALOG:String = "dialogBoxNextDialog";
	}
}
