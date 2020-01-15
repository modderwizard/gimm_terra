package lib.terra.ui
{
	import flash.display.MovieClip;
	import flash.events.TouchEvent;
	import flash.utils.getDefinitionByName;
	
	import lib.terra.ProgressManager;
	
	public class PanelOverviewEntry extends MovieClip
	{
		private var movieClipClass:Class = null;
		private var panelNumber:int;
		
		public function PanelOverviewEntry() 
		{
			this.addEventListener(TouchEvent.TOUCH_TAP, onClicked);
		}
		
		public function setMovieClip(toCreateClass:String, panelNumber:int):void
		{
			this.panelNumber = panelNumber;
			
			if(ProgressManager.unlockedPanels[panelNumber])
			{
				this.movieClipClass = getDefinitionByName(toCreateClass) as Class;
				this.gotoAndStop("Panel" + panelNumber);
			}
			else
			{
				this.gotoAndStop("LOCKED");
				this.removeEventListener(TouchEvent.TOUCH_TAP, onClicked);
			}
		}
		
		private function onClicked(evt:TouchEvent):void
		{
			if(this.movieClipClass != null)
			{
				ProgressManager.unlockedPanels[this.panelNumber + 1] = true;
				
				this.removeEventListener(TouchEvent.TOUCH_TAP, onClicked);
			
				var mcc:MovieClip = new this.movieClipClass();
				
				// Fix movieclips that were made at the wrong resolution
				var wrongResScenes:Array = [1, 2, 5, 8];
				
				if(wrongResScenes.indexOf(this.panelNumber) > -1)
				{
					mcc.width *= 0.625;
					mcc.height *= 0.625;
				}
				
				// Fix movieclips that are positioned wrong and can't be manually fixed to due various issues (ex: classic tweens)
				if(this.panelNumber == 4)
				{
					mcc.x += 350;
					mcc.y += 240;
				}
				
				this.stage.addChild(mcc);
				this.parent.parent.removeChild(this.parent);
			}
		}
	}
}
