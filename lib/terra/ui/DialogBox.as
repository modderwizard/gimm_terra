package lib.terra.ui
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	
	import lib.terra.AudioManager;
	
	// Jonathan
	public class DialogBox extends MovieClip 
	{
		// Vars
		private var dialogs:Array = null;
		private var dialogIndex:int = 0;
		
		private var isRunning:Boolean = false;
		public var isFinished:Boolean = false;
		
		private var targetText:String;
		private var textIndex:Number = 0;
		
		private var talker:String;
		
		// Text box configuration
		private var textSpeed:Number = 1;
		
		public function DialogBox()
		{
			this.addEventListener(Event.ENTER_FRAME, updateText);
		}
		
		// Resets variables to their default values
		public function reset():void
		{
			this.dialogIndex = 0;
			
			this.isRunning = false;
			
			this.targetText = "";
			this.textIndex = 0;
			
			this.talker = "DEFAULT";
		}
		
		public function setData(dialogArray:Array):void
		{
			this.reset();
			
			this.dialogs = dialogArray;
			
			// Splits the dialog definition into two parts (who's talking, and what they're saying)
			// Specify DEFAULT if you don't want a specific speaker
			var textSplit:Array = this.dialogs[this.dialogIndex].split("|");
			this.talker = textSplit[0];
			this.targetText = textSplit[1];
			
			this.dialogPortrait.gotoAndStop(this.talker);
			
			this.isRunning = true;
		}
		
		// Removes the dialog portrait and moves text over to cover gap
		public function setNoPortrait():void
		{
			this.removeChild(this.dialogPortrait);
			this.textField.x -= 128;
			this.textField.width += 128;
		}
		
		// Assign to ENTER_FRAME
		private function updateText(evt:Event):void
		{
			if(this.isRunning)
			{
				// Update text index
				this.textIndex += this.textSpeed;
				var iTextIndex = int(Math.floor(this.textIndex));
				
				// If text index is past the length of the text
				if(iTextIndex > this.targetText.length)
				{
					// Stop text updates and wait until the user advances
					this.isRunning = false;
					
					this.addEventListener(TouchEvent.TOUCH_TAP, onTouchTap);
				}
				
				// Play dialog sound every other character
				if(iTextIndex % 2 == 0)
				{
					AudioManager.playSound("DIALOG_" + this.talker);
				}
				
				// Update text field with new text
				this.textField.text = this.targetText.substr(0, this.textIndex);
			}
		}
		
		// Assign to TOUCH_TAP
		private function onTouchTap(evt:TouchEvent):void
		{
			this.removeEventListener(TouchEvent.TOUCH_TAP, onTouchTap);
			
			this.dialogIndex++;
			
			// True if we ran out of dialogs to display
			if(this.dialogIndex >= this.dialogs.length)
			{
				this.isFinished = true;
				
				// Events are useful and clean!
				this.dispatchEvent(new DialogBoxEvent(DialogBoxEvent.FINISHED));
				
				// S U I C I D E
				this.parent.removeChild(this);
			}
			else
			{
				// Setup and go to the next dialog entry
				var textSplit:Array = this.dialogs[this.dialogIndex].split("|");
				this.talker = textSplit[0];
				this.targetText = textSplit[1];
			
				this.textIndex = 0;
				
				this.dialogPortrait.gotoAndStop(this.talker);
				
				this.isRunning = true;
			}
		}
	}
}
