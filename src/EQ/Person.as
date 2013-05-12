package EQ {
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import com.david.ui.core.MSprite;
	import com.david.ui.event.MUIEvent;
	import com.david.util.StrUtil;

	import org.casalib.events.LoadEvent;
	import org.casalib.load.SwfLoad;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author david
	 */
	public class Person extends MSprite {
		public static var doctor : int = 1;
		public static var hurt : int = 2;
		public static var close : int = 3;
		public static var far : int = 4;
		//
		private var _mc : MovieClip;
		private var _bloodMC : MovieClip;
		private var _rotation : Number;
		private var _stones : Array = new Array();
		public var type : int;

		public function Person(source : String, rotaion : Number, type : int) {
			this.type = type;
			if (type == Person.hurt) {
				loadBlood();
			}
			_rotation = rotaion;
			if (StrUtil.isNullOrEmpty(source))
				return;
			var sl : SwfLoad = new SwfLoad(source);
			sl.addEventListener(LoadEvent.COMPLETE, onComplete);
			sl.start();
		}

		private function loadBlood() : void {
			var sl : SwfLoad = new SwfLoad("EQ/asset/blood.swf");
			sl.addEventListener(LoadEvent.COMPLETE, onBloodComplete);
			sl.start();
		}

		private function  onBloodComplete(e : LoadEvent) : void {
			var sl : SwfLoad = e.target as SwfLoad;
			_bloodMC = sl.contentAsMovieClip;
			addChildAt(_bloodMC, 0);
		}

		private function onComplete(e : LoadEvent) : void {
			var sl : SwfLoad = e.target as SwfLoad;
			_mc = sl.contentAsMovieClip;
			sl.destroy();
			_mc.gotoAndStop(1);
			_mc.rotation = _rotation;
			addChildAt(_mc, 0);
			_mc.addEventListener(MouseEvent.CLICK, onPersonClick);
		}

		public function addStone() : Person {
			var sl : SwfLoad = new SwfLoad("EQ/asset/stone.swf");
			sl.addEventListener(LoadEvent.COMPLETE, onStoneComplete);
			sl.start();
			return this;
		}

		private function onStoneComplete(e : LoadEvent) : void {
			var sl : SwfLoad = e.target as SwfLoad;
			var stone : MovieClip = sl.contentAsMovieClip;
			stone.addEventListener(MouseEvent.CLICK, onStoneClick);
			addChild(stone);
			_stones.push(stone);
			switch(_stones.length) {
				case 0:
					stone.x = -5;
					break;
				case 1:
					stone.x = 5;
					break;
				case 2:
					stone.x = 15;
					break;
				default:
			}
		}

		private function onPersonClick(e : MouseEvent) : void {
			dispatchEvent(new MUIEvent("PersonClick", this, true));
		}

		private function onStoneClick(e : MouseEvent) : void {
			dispatchEvent(new MUIEvent("StoneClick", {stone:e.currentTarget, person:this}, true));
		}

		public function removeStone(stone : DisplayObject) : void {
			var _index : int = _stones.indexOf(stone);
			if (_index >= 0) {
				_stones.splice(_index, 1);
			}
			if (contains(stone))
				removeChild(stone);
		}

		public function hasStone() : Boolean {
			return _stones.length > 0;
		}
	}
}
