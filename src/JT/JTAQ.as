package JT {
	import com.david.ui.MButton;
	import com.david.ui.MImage;
	import com.david.ui.core.MSprite;
	import com.david.util.UtilManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.LocalConnection;
	import flash.net.URLRequest;
	
	import selib.GameTimer;
	import selib.Record;
	import selib.RecordUtil;
	import selib.ui.RecordUI;
	
	import util.FinishAlert;

	/**
	 * @author david
	 */
	public class JTAQ extends MSprite {
		
		private var _recordUI :RecordUI = RecordUI.getInstance("jtaq_record");
		public var _recordBtn : MButton;
		public var _time :GameTimer;
		private var _receiver :LocalConnection;
		private var _records : XML;
		public function JTAQ() {
			super();
			
			_records = RecordUtil.readRecord("jtaq.xml");
			_recordUI.setSource(_records);
			_receiver = new LocalConnection();
			_receiver.client = this;
			_receiver.connect("AVM1toAVM2");
			
			_recordBtn = new MButton(new MImage("asset/recordBtn.png"));
			
			_time = new GameTimer();
			
			_recordBtn.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});

			var m : MButton = new MButton(new MImage("JT/asset/jtaq.jpg"));
			m.addEventListener(MouseEvent.CLICK, loadSWF);
			addChild(m);
		}

		private function loadSWF(e : MouseEvent) : void {
			var l : Loader = new Loader();
			l.contentLoaderInfo.addEventListener(Event.INIT, onInit);
			l.load(new URLRequest("JT/asset/jtaq.swf"));
			addChild(l);
			l.scaleY = l.scaleX = 1.72;
			//
			addChildXY(_recordBtn, 50, 75);
			addChildXY(_time,210,80);
			_time.start();
		}
		
		public function endGame() : void {
			_time.stop();
			var record:Record=RecordUtil.ReturnTop5Record(_records,_time.time);
			if(record.top5){
				RecordUtil.saveRecord("jtaq.xml",record.records);
			}
			this.removeAllChildren();
			FinishAlert.show(record.top5,this);
		}


		private function onInit(e : Event) : void {
		}
	}
}
