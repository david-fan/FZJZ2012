package selib.ui {
	import selib.asset.Asset;

	import com.david.ui.MButton;
	import com.david.ui.MStrokeMachineText;
	import com.david.ui.core.MUIComponent;
	import com.david.util.UtilManager;

	import flash.events.MouseEvent;
	import flash.utils.Dictionary;



	/**
	 * @author david
	 */
	public class AlertUI extends MUIComponent {
		public var closeBtn : MButton;
		public var rule : MStrokeMachineText;

		public function AlertUI(mouseEnabled : Boolean = false) {
			super(mouseEnabled);
			this.background = new Asset.ruleClass();
			closeBtn = new MButton(new Asset.closeBtnClass());
			addChildXY(closeBtn, 275, 0);
			rule = new MStrokeMachineText();
			addChildXY(rule, 20, 50);

			closeBtn.addEventListener(MouseEvent.CLICK, close);
		}

		private function close(e : MouseEvent) : void {
			UtilManager.popUpUtil.removePopUp(this);
		}

		private static var _instances : Dictionary = new Dictionary();

		public static function getInstance(name : String) : AlertUI {
			if (_instances[name] == null) {
				_instances[name] = new AlertUI();
			}

			return _instances[name];
		}
	}
}
