package MG {
	import com.david.ui.MButton;
	import com.david.ui.MImage;
	import com.david.ui.core.MSprite;
	import com.david.util.UtilManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.LocalConnection;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import selib.GameTimer;
	import selib.Record;
	import selib.RecordUtil;
	import selib.SoundUtil;
	import selib.ui.RecordUI;
	
	import util.FinishAlert;

	/**
	 * @author david
	 */
	public class DZMG extends MSprite {
		
		private var _recordUI : RecordUI = RecordUI.getInstance("dzmg_record");
		public var _recordBtn : MButton;
		public var _time : GameTimer;
		private var _receiver : LocalConnection;
		private var _records : XML;
		
		public function DZMG() {
			super();

			_records = RecordUtil.readRecord("dzmg.xml");
			_recordUI.setSource(_records);
			_receiver = new LocalConnection();
			_receiver.client = this;
			_receiver.connect("AVM1toAVM2");

			var m : MButton = new MButton(new MImage("MG/asset/dzmg.jpg"));
			m.addEventListener(MouseEvent.CLICK, loadSWF);
			addChild(m);

			_recordBtn = new MButton(new MImage("asset/recordBtn.png"));

			_time = new GameTimer();

			_recordBtn.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});
		}

		private function loadSWF(e : MouseEvent) : void {
			var l : Loader = new Loader();
			l.contentLoaderInfo.addEventListener(Event.INIT, onInit);
			l.load(new URLRequest("MG/asset/dzmg.swf"));
			addChild(l);
			addChildXY(_recordBtn, 96, 35);
			addChildXY(_time, 296, 30);
			_time.start();
		}

		public function endGame() : void {
			_time.stop();
			var record:Record=RecordUtil.ReturnTop5Record(_records,_time.time);
			if(record.top5){
				RecordUtil.saveRecord("dzmg.xml",record.records);
			}FinishAlert.show(record.top5,this);
		}

		private function onInit(e : Event) : void {
			SoundUtil.PlaySound("MG/asset/dzmg.mp3", int.MAX_VALUE);
		}
	}
}
