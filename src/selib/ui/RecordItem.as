package selib.ui {
	import com.david.ui.MMachineTextBlock;
	import com.david.ui.core.IListItem;
	import com.david.ui.core.MUIComponent;

	import flash.text.engine.FontWeight;
	/**
	 * @author david
	 */
	public class RecordItem extends MUIComponent implements IListItem {
		private var _index : MMachineTextBlock;
		private var _value : MMachineTextBlock;

		public function RecordItem(mouseEnabled : Boolean = false) {
			super(mouseEnabled);
			_index = new MMachineTextBlock(null,18,0xffffff,100,"Arial",FontWeight.BOLD);
			addChild(_index);
			_value = new MMachineTextBlock(null,18,0xffffff,100,"Arial",FontWeight.BOLD);
			addChild(_value);
			_value.x = 120;
		}

		public function get data() : Object {
			// TODO: Auto-generated method stub
			return null;
		}

		public function set data(value : Object) : void {
			_index.text = value.index;
			_value.text = value.value;
		}
	}
}
