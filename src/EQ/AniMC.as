package EQ{
	import com.david.ui.core.MSprite;

	import org.casalib.events.LoadEvent;
	import org.casalib.load.SwfLoad;

	import flash.display.MovieClip;

	/**
	 * @author david
	 */
	public class AniMC extends MSprite {
		private var _mc : MovieClip;

		public function AniMC(source : String) {
			var sl : SwfLoad = new SwfLoad(source);
			sl.addEventListener(LoadEvent.COMPLETE, onComplete);
			sl.start();
		}

		private function onComplete(e : LoadEvent) : void {
			var sl : SwfLoad = e.target as SwfLoad;
			_mc = sl.contentAsMovieClip;
			sl.destroy();
			_mc.gotoAndStop(1);
			addChild(_mc);
		}

		public function playAnimation() : void {
			_mc.gotoAndStop(2);
		}

		public function stopAnimation() : void {
			_mc.gotoAndStop(1);
		}
	}
}
