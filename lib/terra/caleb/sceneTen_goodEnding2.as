package lib.terra.caleb {
	
	import flash.display.MovieClip;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneTen_goodEnding2 extends MovieClip {
		
		
		public function openDialog(): void 
		{
			var dialogbox:DialogBox = new DialogBox();
			dialogbox.setData(["FATHER|Come with me, we have an old rocket that may still be usable.","FATHER|We can use our generator to start it, then you can go home."]);
			this.addChild(dialogbox);
			dialogbox.addEventListener(DialogBoxEvent.FINISHED, ondialog);
		}
		
		private function ondialog(evt:DialogBoxEvent):void
		{
			parent.addChild(new sceneTen_goodEnding3());
			parent.removeChild(this);
		}
	}
	
}
