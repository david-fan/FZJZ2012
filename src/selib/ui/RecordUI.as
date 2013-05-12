package selib.ui {
	import com.david.ui.MButton;
	import com.david.ui.MTileList;
	import com.david.ui.core.MUIComponent;
	import com.david.util.UtilManager;
	
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import selib.asset.Asset;



	/**
	 * @author david
	 */
	public class RecordUI extends MUIComponent {
		public var closeBtn : MButton;
		public var list : MTileList;

		public function RecordUI(mouseEnabled : Boolean = false) {
			super(mouseEnabled);
			this.background = new Asset.recordClass();
			closeBtn = new MButton(new Asset.closeBtnClass());
			addChildXY(closeBtn, 275, 0);
			var title:RecordItem=new RecordItem();
			title.data={index:"排名",value:"成绩"};
			addChildXY(title,55,85);
			list = new MTileList(RecordItem, 1, 5);
			addChildXY(list, 55, 115);

			closeBtn.addEventListener(MouseEvent.CLICK, close);
		}

		public function setSource(source : XML) : void {
			var objects : Array = new Array();
			for each (var item:XML in source.record) {
				var object : Object = new Object();
				object.value = int(item.@value);
				object.index = 0;
				objects.push(object);
				
			}objects.sortOn("value");
			for(var i:int=0;i<objects.length;i++){
				objects[i].index=(i+1);
			}
			list.source = objects;
		}

		private function close(e : MouseEvent) : void {
			UtilManager.popUpUtil.removePopUp(this);
		}

		private static var _instances : Dictionary = new Dictionary();

		public static function getInstance(name : String) : RecordUI {
			if (_instances[name] == null) {
				_instances[name] = new RecordUI();
			}

			return _instances[name];
		}
	}
}
