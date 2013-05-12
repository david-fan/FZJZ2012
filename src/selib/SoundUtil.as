package selib {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;

	public class SoundUtil {
		private static var scs : Dictionary = new Dictionary();

		public function SoundUtil() {
		}

		public static function PlaySound(url : String, loop : int = 1) : void {
			// var sc:SoundChannel = scs[name] as SoundChannel;
			var sound : Sound = new Sound(new URLRequest(url));
			var sc : SoundChannel = sound.play(0, loop);
			scs[url] = sc;
		}

		public static function StopPlay(name : String) : void {
			var sc : SoundChannel = scs[name] as SoundChannel;
			if (sc)
				sc.stop();
		}
	}
}