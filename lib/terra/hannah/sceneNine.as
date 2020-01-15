package lib.terra.hannah {

	import flash.display.MovieClip;
	import flash.events.Event;


	public class sceneNine extends MovieClip 
	{
		private var _sceneOne: MovieClip;
		

		public function sceneNine() 
		{
			_sceneOne = new scene_9();
			

			addChild(_sceneOne);
			_sceneOne.gotoAndPlay(1);

			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event: Event) 
		{
			if (_sceneOne.currentFrame == 96) 
				{
					removeChild(_sceneOne);
					stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					
					//if(main character has the core)
					//{

					//}

					//if(main character does not have the core)
					//{

					//}

					var i: int = this.numChildren;
					while (i--) 
						{
							removeChildAt(i);
						}
						
					NoCore(); 
						
					
				}
		}
			
		private function NoCore():void
			{
				/*(if condition.check.here == The bad ending)
				{ 
					var _sceneTwo:sceneNine_badEnding1 = new sceneNine_badEnding1();
					this.parent.addChild(_sceneTwo);
					this.parent.removeChild(this);
				}*/
				
				/*(if condition.check.here == The good ending)
				{
					var _newScene:sceneNine_goodEnding1 = new sceneNine_goodEnding1();
					this.parent.addChild(_newScene);
					this.parent.removeChild(this);
				}
				*/
					
				var _sceneTwo:sceneNine_badEnding1 = new sceneNine_badEnding1();
				this.parent.addChild(_sceneTwo);
				this.parent.removeChild(this);
			}

				
				

		
	}
}