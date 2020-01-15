package lib.terra.jonathan.scene6 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import fl.VirtualCamera;
	
	public class Scene6IntroPart2 extends MovieClip 
	{	
		public function Scene6IntroPart2() 
		{
			this.alien.addEventListener(TouchEvent.TOUCH_MOVE, alien_onTouchMove);
		}
		
		// Called when the user moves their finger on the screen
		private function alien_onTouchMove(evt:TouchEvent):void
		{
			this.alien.x = evt.stageX - (this.alien.width / 2);
			
			if(this.alien.x < 0 || this.alien.x > 800 - this.alien.width)
			{
				this.alien.removeEventListener(TouchEvent.TOUCH_MOVE, alien_onTouchMove);
				(this.parent as MovieClip).play();
			}
		}
	}
}
