package lib.terra.sydney
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Stage;
	import flash.text.TextField;
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class SfiveCode extends MovieClip {

		public function SfiveCode() {
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
			dialogBox.setData(["ALIEN|Thanks for bringing me to the village little human.", "SON|No problem mister Alien, see ya later!"]);
			this.addChild(dialogBox);
			
			dialogBox.addEventListener(DialogBoxEvent.FINISHED,dialogOver);
			
			// The mismatched resolution fix screws with the text boxes, so here's another fix
			dialogBox.y = -670 + dialogBox.height;
			dialogBox.width /= 0.625;
			dialogBox.height /= 0.625;
			
			//_Background.see_Generator.addEventListener(MouseEvent.CLICK, walkFunction);
			// constructor code
		}
		
		public function dialogOver(evt:DialogBoxEvent):void
		{
			parent.addChild(new PanelOverview());
			parent.removeChild(this);
		}
	}
}
