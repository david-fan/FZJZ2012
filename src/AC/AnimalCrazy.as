package AC {
	import com.david.ui.MBox;
	import com.david.ui.MButton;
	import com.david.ui.MDirection;
	import com.david.ui.MImage;
	import com.david.ui.core.MSprite;
	import com.david.util.UtilManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
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
	public class AnimalCrazy extends MSprite {
		private var _parts : Array = new Array();
		private var _currentPart : Part;
		private var _container : MSprite;
		private var _timer : GameTimer;
		//
		[Embed(source="asset/background.png")]
		private var backgroundPng : Class;
		[Embed(source="asset/title.png")]
		private var titlePng : Class;
		[Embed(source="asset/des.png")]
		private var desPng : Class;
		[Embed(source="asset/record.png")]
		private var recordPng : Class;
		//[Embed(source="asset/time.png")]
		//private var timePng : Class;
		[Embed(source="asset/right.png")]
		private var rightPng : Class;
		[Embed(source="asset/wrong.png")]
		private var wrongPng : Class;
		//
		private var _result : MBox;
		private var _records : XML;
		//
		private var _recordUI : RecordUI = RecordUI.getInstance("animal_cary");

		public function AnimalCrazy() {
			super();

			addChildXY(new backgroundPng());
			addChildXY(new titlePng(), 55, 65);
			//
			var record : MButton = new MButton(new recordPng());
			addChildXY(record, 790, 75);
			record.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});
			//
			_container = new MSprite();
			addChildXY(_container, 110, 170);
			_parts.push(new Part( new BaseItem("AC/asset/mule.swf", "AC/asset/mule.jpg", 60, 140),new BaseItem("AC/asset/cow.swf", "AC/asset/cow.jpg", 60, 140)));
			_parts.push(new Part(new BaseItem("AC/asset/dog.swf", "AC/asset/dog.jpg", 60, 140), new BaseItem("AC/asset/pig.swf", "AC/asset/pig.jpg", 60, 140)));
			_parts.push(new Part(new BaseItem("AC/asset/duck.swf", "AC/asset/duck.jpg", 60, 140), new BaseItem("AC/asset/chiken.swf", "AC/asset/chiken.jpg", 110, 190)));
			_parts.push(new Part(new BaseItem("AC/asset/fish1.swf", "AC/asset/fish1.jpg", 60, 140),new BaseItem("AC/asset/fish2.swf", "AC/asset/fish2.jpg", 60, 140)));
			_parts.push(new Part(new BaseItem("AC/asset/rabit2.swf", "AC/asset/rabit2.jpg", 60, 140),new BaseItem("AC/asset/rabit1.swf", "AC/asset/rabit1.jpg", 60, 140)));
			_parts.push(new Part(new BaseItem("AC/asset/snake2.swf", "AC/asset/snake2.jpg", 60, 140),new BaseItem("AC/asset/snake1.swf", "AC/asset/snake1.jpg", 100, 280)));
			_parts.push(new Part(new BaseItem("AC/asset/bird.swf", "AC/asset/bird.jpg", 60, 140), new BaseItem("AC/asset/bee.swf", "AC/asset/bee.jpg", 60, 140)));
			addEventListener("right", onRight);
			addEventListener("wrong", onWrong);
			//
			//var time : MImage = new MImage(new timePng());
			//addChildXY(time, 110, 650);
			
			_result = new MBox(false, MDirection.Horizon, 2, true);
			addChildXY(_result, 450, 640);
			_result.scaleX=_result.scaleY=0.5;
			//
			_timer = new GameTimer();
			addChildXY(_timer, 625, 70);
			//
			_records = RecordUtil.readRecord("dwyfk.xml");
			_recordUI.setSource(_records);

			var m : MButton = new MButton(new MImage("AC/asset/dwyfk.jpg"));
			m.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				_timer.start();
				start();
				removeChild(m);
			});
			addChild(m);
		}

		private function start() : void {
			if (_currentPart != null) {
				_currentPart.stop();
				if (_container.contains(_currentPart))
					_container.removeChild(_currentPart);
			}
			_currentPart = _parts.shift() as Part;
			if (_currentPart == null){
				_timer.stop();
				showEnd();
				return;
			}
			_container.addChild(_currentPart);
			_currentPart.start();
		}
		
		private function showEnd():void{
			this.addChildXY(new MImage("AC/asset/21.jpg"),0,0);
			SoundUtil.PlaySound("AC/asset/21.mp3");
			setTimeout(endGame,27*1000);
		}
		
		private function endGame():void{
			
			var record:Record=RecordUtil.ReturnTop5Record(_records,_timer.time);
			if(record.top5){
				RecordUtil.saveRecord("dwyfk.xml",record.records);
			}
			FinishAlert.show(record.top5,this);
		}

		private function onRight(e : Event) : void {
			trace("select right");
			start();
			_result.addChild(new rightPng());
		}

		private function onWrong(e : Event) : void {
			trace("select wrong");
			start();
			_result.addChild(new wrongPng());
		}
	}
}
