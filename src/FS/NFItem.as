package FS {
	import flash.events.Event;
	import flash.events.MouseEvent;

	import com.david.ui.MImage;

	/**
	 * @author david
	 */
	public class NFItem extends MImage {
		public static const FoodSelect : String = "NFItem.FoodSelect";

		public function NFItem(source : Object = null, sizeType : String = "auto") {
			super(source, sizeType);

			addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		private function onMouseClick(e : MouseEvent) : void {
			dispatchEvent(new Event(FoodSelect, true));
		}
	}
}
