package selib {
	import com.david.ui.MImage;
	import com.david.ui.MMachineTextBlock;
	import com.david.ui.core.MUIComponent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.engine.FontWeight;
	import flash.utils.Timer;
	
	import selib.asset.Asset;

	/**
	 * @author david
	 */
	public class GameTimer extends MUIComponent {
		private var _icon:MImage;
		private var _timer : Timer;
		private var _txt : MMachineTextBlock;

		public function GameTimer(fontsize : int = 30) {
			super(false);
			_txt = new MMachineTextBlock("", fontsize, 0xffffff, 200, "Arial", FontWeight.BOLD);
			addChild(_txt);
			_txt.x=50;
			_txt.y=10;
			
			_icon=new MImage(new Asset.timeIcon());
			this.addChild(_icon);
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
		public function get time() : int {
			return _timer.currentCount;
		}

		private function onTimer(e : Event) : void {
			_txt.text = TimerUtil.GetTimeStr(_timer.currentCount);
		}

		public function start() : void {
			_timer.start();
		}

		public function stop() : void {
			_timer.stop();
		}
	}
}
