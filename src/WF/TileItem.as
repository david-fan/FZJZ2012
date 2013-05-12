package WF {
	import com.david.ui.MImage;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;

	/**
	 * @author david
	 */
	public class TileItem extends MImage {
		public static var Right : String = "TileItem.Right";
		public static var Wrong : String = "TileItem.Wrong";
		private var _can : Boolean;
		public var des : String;
		private var _despatch:Boolean;
		public var sound:String;

		public function TileItem(source : String, sound:String,can : Boolean, des : String = null) {
			super("WF/" + source);
			_can = can;
			this.sound=sound;
			this.des = des;
			
			addEventListener(MouseEvent.CLICK, onClick);

			useHandCursor = true;
			buttonMode = true;
		}

		private function onClick(e : MouseEvent) : void {
			
			if(_despatch)
				return;
			_despatch=true;
			//
			var l:Loader=this.image as Loader;
			var mc:MovieClip=l.content as MovieClip;
			if(mc!=null)
				mc.gotoAndPlay(2);
			//
			if (_can)
				dispatchEvent(new Event(Right, true));
			else{
				dispatchEvent(new Event(Wrong, true));
			}
		}

		override public function get width() : Number {
			return 215;
		}

		override public function get height() : Number {
			return 245;
		}
	}
}
