package lib.terra.ui 
{
	import flash.display.MovieClip;
	import flash.events.TouchEvent;
	import flash.geom.ColorTransform;
	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	// Jonathan
	public class FuelBar extends MovieClip 
	{
		private var fuelPercentage:int = 100;
		
		// Stores the colors for the fuel bar. In hindsight I could've just made a 100 frame animation with a color transform tween.
		// But I already wrote a tool that converts a 1D color gradient image into an int array so whatevs.
		private const fuelColors:Array = [16711680,16713216,16714496,16716032,16717312,16718848,16720384,16721664,16723200,16724736,16726016,16727296,16728832,16730368,16731904,16733184,16734720,16736000,16737536,16738816,16740352,16741888,16743424,16744704,16745984,16747520,16749056,16750336,16751872,16753152,16754688,16756224,16757504,16759040,16760576,16761856,16763136,16764672,16766208,16767744,16769024,16770560,16771840,16773376,16774656,16776192,16776704,16776960,16776960,16776960,16776960,16776960,16776960,16776960,16776960,16711424,16580352,16252672,15859456,15466240,15073024,14745344,14352128,13958912,13565696,13238016,12844800,12451584,12058368,11730688,11337472,10944256,10551040,10223360,9830144,9436928,9043712,8716032,8322816,7929600,7536384,7143168,6815488,6422272,6029056,5701376,5373696,4980480,4587264,4194048,3866368,3473152,3079936,2686720,2359040,1965824,1572608,1179392,851712,458496,458496];
		
		public function FuelBar()
		{
			this.addEventListener(TouchEvent.TOUCH_TAP, onTouchTap);
		}
		
		public function onTouchTap(evt:TouchEvent):void
		{
			// Animates between hidden and shown state using Greensock
			if(this.y == -248)
			{
				TweenLite.to(this, 1, {x:0, y:0, ease:Bounce.easeOut});
			}
			if(this.y == 0)
			{
				TweenLite.to(this, 1, {x:0, y:-248, ease:Back.easeOut});
			}
		}
		
		public function setFuelPercentage(fuelPercentage:int):void
		{
			// Update fuel percentage and fuel bar height
			this.fuelPercentage = fuelPercentage;
			this.fuelFill.height = 248 * (fuelPercentage / 100.0);
			
			// Create a new color transform using the color array
			var newColor:ColorTransform = new ColorTransform();
			newColor.color = this.fuelColors[fuelPercentage];
			this.fuelFill.transform.colorTransform = newColor;
		}
		
		public function getFuelPercentage():int
		{
			return this.fuelPercentage;
		}
	}
}
