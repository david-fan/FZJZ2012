package AC{
	import com.david.ui.core.MSprite;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author david
	 */
	public class Part extends MSprite {
		private var _right : BaseItem;
		private var _wrong : BaseItem;

		public function Part(right : BaseItem, wrong : BaseItem) {
			super();
			_right = right;
			_wrong = wrong;
			addChild(_right);
			addChild(_wrong);
			if (Math.random() > 0.5)
				_wrong.x = 450;
			else
				_right.x = 450;
			_right.addEventListener(MouseEvent.CLICK, onRightClick);
			_wrong.addEventListener(MouseEvent.CLICK, onWrongClick);
		}

		public function start() : void {
			_right.start();
			_wrong.start();
		}

		public function stop() : void {
			_right.stop();
			_wrong.stop();
		}

		private function onRightClick(e : MouseEvent) : void {
			dispatchEvent(new Event("right", true));
		}

		private function onWrongClick(e : MouseEvent) : void {
			dispatchEvent(new Event("wrong", true));
		}
		
		override public function destroy() : void {
			super.destroy();
			_right.removeEventListener(MouseEvent.CLICK, onRightClick);
			_right = null;
			_wrong.removeEventListener(MouseEvent.CLICK, onWrongClick);
			_wrong = null;
		}
	}
}
