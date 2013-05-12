package selib{
	public class TimerUtil {
		public function TimerUtil() {
		}

		public static function GetTimeStr(time : int) : String {
			return getTimeStr(time / 60) + ":" + getTimeStr(time % 60);
		}

		private static function getTimeStr(t : int) : String {
			if (t < 10)
				return "0" + t;
			else
				return t.toString();
		}
	}
}