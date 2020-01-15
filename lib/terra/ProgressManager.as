package lib.terra
{
	public class ProgressManager
	{
		// Tracks which power cores have been taken
		public static var hasTakenVillagePowerCore:Boolean = false;
		public static var hasTakenDamPowerCore:Boolean = false;
		
		// Tracks which panels are unlocked
		public static var unlockedPanels:Array = [null, true, false, false, false, false, false, false, false, false, false];
		//public static var unlockedPanels:Array = [null, true, true, true, true, true, true, true, true, true, true];
	}
}
