package lib.terra
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class ParallaxBackground extends MovieClip
	{
		// Three instances of the background
		public var bgLeft:MovieClip, bgCenter:MovieClip, bgRight:MovieClip;
		
		// Parallax scrolling speeds
		public var scrollSpeedHorizontal:Number, scrollSpeedVertical:Number;
		
		// Manually offsets the position
		private var initialOffsetX:Number;
		private var initialOffsetY:Number;
		
		// Auto seam fix flips every other repetition of the background to remove 
		// seams without requiring both sides of the background to match up.
		private var enableAutoFixSeam:Boolean;
		
		public function ParallaxBackground(className:String, scrollSpeedHorizontal:Number, scrollSpeedVertical:Number, initialOffsetX:Number, initialOffsetY:Number, enableAutoFixSeam:Boolean = false)
		{
			var backgroundClass:Class = getDefinitionByName(className) as Class;
			
			// Init background instances
			this.bgCenter = new backgroundClass();
			this.bgLeft = new backgroundClass();
			this.bgRight = new backgroundClass();
			
			this.addChild(this.bgCenter);
			this.addChild(this.bgLeft);
			this.addChild(this.bgRight);
			
			// Flip movie clips and adjust their position
			if(enableAutoFixSeam)
			{
				this.bgLeft.scaleX = -1;
				this.bgRight.scaleX = -1;
				this.bgLeft.x += this.bgLeft.width;
				this.bgRight.x += this.bgRight.width;
			}
			
			this.scrollSpeedHorizontal = scrollSpeedHorizontal;
			this.scrollSpeedVertical = scrollSpeedVertical;
			
			this.initialOffsetX = initialOffsetX;
			this.initialOffsetY = initialOffsetY;
			
			this.enableAutoFixSeam = enableAutoFixSeam;
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(evt:Event):void
		{
			// Adjust the scroll value 
			var adjustedCamX:Number = (CameraManager.x + this.initialOffsetX) * this.scrollSpeedHorizontal;
			
			while(adjustedCamX < -this.bgCenter.width)
			{
				adjustedCamX += this.bgCenter.width * 2;
			}
			
			while(adjustedCamX > this.bgCenter.width)
			{
				adjustedCamX -= this.bgCenter.width * 2;
			}
			
			// Vertical scrolling unimplemented for the moment since it is not needed
			this.bgCenter.x = -adjustedCamX;
			this.bgCenter.y = this.initialOffsetY;
			
			// Adjust the position of the two other instances based
			this.bgLeft.x = this.bgCenter.x - this.bgCenter.width;
			this.bgLeft.y = this.bgCenter.y;
			
			this.bgRight.x = this.bgCenter.x + this.bgCenter.width;
			this.bgRight.y = this.bgCenter.y;
			
			// Adjust the position of any flipped movie clips
			if(this.enableAutoFixSeam)
			{
				this.bgLeft.x += this.bgLeft.width;
				this.bgRight.x += this.bgRight.width;
			}
		}
	}
}