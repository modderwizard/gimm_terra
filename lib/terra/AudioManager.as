package lib.terra
{
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;

	public class AudioManager
	{
		private static var soundMap:Dictionary = new Dictionary();
		
		private static var volumeTransform:SoundTransform = new SoundTransform(0.5);
		
		// Static constructor
		// Went with this method for Audio as it makes it really clean to play sounds later (just AudioManager.playSound(SOUND))
		// Plus it allows us to easily have global volume control for all sounds
		{
			AudioManager.soundMap["DIALOG_DEFAULT"] = new SfxDialogDefault();
			AudioManager.soundMap["DIALOG_ALIEN"] = new SfxDialogAlien();
			AudioManager.soundMap["DIALOG_STRANGER"] = new SfxDialogStranger();
			AudioManager.soundMap["DIALOG_FATHER"] = new SfxDialogStranger();
			// FIX ME LATER
			AudioManager.soundMap["DIALOG_SON"] = new SfxDialogDefault();
			
			// Alex
			AudioManager.soundMap["SPACESHIP_SOUND"] = new flyingsound();
			AudioManager.soundMap["RING_TONE"] = new ringtone();
			AudioManager.soundMap["EMERGENCY"] = new emergency();
			
			// Caleb
			AudioManager.soundMap["BIG_SPLASH"] = new SfxBigSplash();
			
			// Jonathan
			AudioManager.soundMap["SFX_MYSTERY"] = new SfxMystery();
		}
		
		public static function setVolume(volume:Number):void
		{
			AudioManager.volumeTransform.volume = volume;
		}
		
		public static function getVolume():Number
		{
			return AudioManager.volumeTransform.volume;
		}
		
		public static function playSound(soundName:String)
		{
			AudioManager.soundMap[soundName].play(0, 0, AudioManager.volumeTransform);
		}
	}
}