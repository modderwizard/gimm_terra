package lib.terra.sydney.scene6 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import lib.terra.ProgressManager;
	import lib.terra.StageManager;
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class SceneGeneratorInteract extends MovieClip 
	{
		private var isHoldingCore:Boolean = false;
		private var hasTakenCore:Boolean = false;
		
		public function SceneGeneratorInteract() 
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			this.powerCore.addEventListener(TouchEvent.TOUCH_BEGIN, core_onTouchBegin);
			this.powerCore.addEventListener(TouchEvent.TOUCH_END, core_onTouchEnd);
			this.powerCore.addEventListener(TouchEvent.TOUCH_MOVE, core_onTouchMove);
			
			this.backButton.addEventListener(TouchEvent.TOUCH_TAP, backButton_onTouchTap);
			
			StageManager.setInterfaceVisible(true);
		}
		
		private function onEnterFrame(evt:Event):void
		{
			if(this.powerCore.y <= 140 && this.isHoldingCore)
			{
				this.hasTakenCore = true;
				
				this.powerCore.y = 140;
				this.isHoldingCore = false;
				
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				this.powerCore.removeEventListener(TouchEvent.TOUCH_BEGIN, core_onTouchBegin);
				this.powerCore.removeEventListener(TouchEvent.TOUCH_END, core_onTouchEnd);
				this.powerCore.removeEventListener(TouchEvent.TOUCH_MOVE, core_onTouchMove);
				
				this.powerCoreBeam.play();
				
				var dialogBox:DialogBox = new DialogBox();
				dialogBox.setData(["ALIEN|Hmm... This seems to be enough energy for me to finally go home!"]);
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				this.addChild(dialogBox);
				
				this.backButton.visible = false;
			}
		}
		
		private function dialogBoxFinished(evt:DialogBoxEvent):void
		{
			this.removeChild(this.powerCore);
			
			StageManager.setFuelPercentage(StageManager.getFuelPercentage() + 50);
			
			this.backButton.visible = true;
		}
		
		// Core functions
		private function core_onTouchBegin(evt:TouchEvent):void
		{
			this.isHoldingCore = true;
		}
		
		private function core_onTouchEnd(evt:TouchEvent):void
		{
			this.isHoldingCore = false;
		}
		
		private function core_onTouchMove(evt:TouchEvent):void
		{
			if(this.isHoldingCore)
			{
				this.powerCore.y = Math.min(evt.stageY - (this.powerCore.height / 2), 267);
			}
		}
		
		// Back button functions
		private function backButton_onTouchTap(evt:TouchEvent):void
		{
			if(!this.hasTakenCore)
			{
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
				this.powerCore.removeEventListener(TouchEvent.TOUCH_BEGIN, core_onTouchBegin);
				this.powerCore.removeEventListener(TouchEvent.TOUCH_END, core_onTouchEnd);
				this.powerCore.removeEventListener(TouchEvent.TOUCH_MOVE, core_onTouchMove);
			}
			
			this.backButton.removeEventListener(TouchEvent.TOUCH_TAP, backButton_onTouchTap);
			
			ProgressManager.hasTakenDamPowerCore = this.hasTakenCore;
			
			this.stage.addChild(new PanelOverview());
			this.parent.removeChild(this);
		}
	}
}
