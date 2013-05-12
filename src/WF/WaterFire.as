package WF {
	import com.david.ui.MButton;
	import com.david.ui.MDirection;
	import com.david.ui.MImage;
	import com.david.ui.MMachineTextBlock;
	import com.david.ui.MTile;
	import com.david.ui.core.MUIComponent;
	import com.david.util.UtilManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.FontType;
	import flash.text.engine.FontWeight;
	
	import org.casalib.events.LoadEvent;
	import org.casalib.load.SwfLoad;
	
	import selib.GameTimer;
	import selib.Record;
	import selib.RecordUtil;
	import selib.SoundUtil;
	import selib.ui.RecordUI;
	
	import util.FinishAlert;

	/**
	 * @author david
	 */
	public class WaterFire extends MUIComponent {
		private var _record : MButton;
		private var _timer : GameTimer;
		//
		private var _tile : MTile;
		private var _tileItems : Array;
		private var _right:int;
		//
		private var _recordUI : RecordUI = RecordUI.getInstance("water_fire");
		private var _records : XML;
		private var _tip:MMachineTextBlock;
		private var _soundChanle:SoundChannel;

		public function WaterFire(mouseEnabled : Boolean = false) {
			super(mouseEnabled);
			
			_records = RecordUtil.readRecord("syh.xml");
			_recordUI.setSource(_records);

			background = new MImage("WF/asset/background.jpg");
			_record = new MButton();
			addChildXY(_record, 725, 20);
			var sl2 : SwfLoad = new SwfLoad("WF/asset/record.swf");
			sl2.addEventListener(LoadEvent.COMPLETE, function(e : LoadEvent) : void {
				_record.skin = sl2.contentAsMovieClip;
			});
			_record.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});
			sl2.start();
			var title : MImage = new MImage("WF/asset/title.swf");
			addChildXY(title, 45, 5);
//			var time : MImage = new MImage("WF/asset/time.png");
//			addChildXY(time, 855, 20);
			//
			_tip=new MMachineTextBlock("哪些东西起火可以用水扑灭呢？",16,0x000000,400,'SimSun',FontWeight.BOLD);
			addChildXY(_tip,350,670);
			//
			_tile = new MTile(MDirection.Vertical, 2, 5);
			addChildXY(_tile, 40, 105);
			_tile.addEventListener(TileItem.Wrong, onWrong);
			_tile.addEventListener(TileItem.Right,onRight);
			//
			_tileItems = new Array();
			_tileItems.push(new TileItem("asset/batter.swf","14.mp3", false, "水容易和钾、钠、电石等物质发生反应，用水扑救，会放出可燃气体，使火势扩大。"));
			_tileItems.push(new TileItem("asset/book.swf","", true));
			_tileItems.push(new TileItem("asset/chair.swf", "",true));
			_tileItems.push(new TileItem("asset/cloth.swf","", true));
			_tileItems.push(new TileItem("asset/desk.swf", "",true));
			_tileItems.push(new TileItem("asset/metal.swf", "13.mp3",false, "用水扑灭炽热金属、盐类火灾，容易使水大量汽化，飞溅伤人。"));
			_tileItems.push(new TileItem("asset/petrol.swf","11.mp3", false, "汽油、煤油等油类物质不溶于水，如果用水扑救，它们会漂浮在水面上，使火迅速蔓延，造成火海。"));
			_tileItems.push(new TileItem("asset/telvision.swf","12.mp3", false, "各种电器起火，不能用水扑救。因为水本身导电，容易造成人员伤亡。"));

			while (_tileItems.length > 0) {
				var index : int = Math.floor(_tileItems.length * Math.random());
				var ti : TileItem = _tileItems.splice(index, 1)[0];
				_tile.addChild(ti);
			}
			_timer = new GameTimer();
			addChildXY(_timer, 860, 20);

			var m : MButton = new MButton(new MImage("WF/asset/syh.jpg"));
			m.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				_timer.start();
				//
				SoundUtil.PlaySound("WF/asset/alarm.mp3", 999);
				SoundUtil.PlaySound("WF/asset/fire.mp3", 999);
				//
				removeChild(m);
			});
			addChild(m);
		}
		
		public function endGame() : void {
			_timer.stop();
			var record:Record=RecordUtil.ReturnTop5Record(_records,_timer.time);
			if(record.top5){
				RecordUtil.saveRecord("syh.xml",record.records);
			}
			FinishAlert.show(record.top5,this);
		}

		private function onWrong(e : Event) : void {
			var ti : TileItem = e.target as TileItem;
			_tip.text=ti.des;
			//
			if(_soundChanle)
				_soundChanle.stop();
			var s:Sound=new Sound(new URLRequest("WF/asset/"+ti.sound));
			_soundChanle=s.play();
		}
		
		private function onRight(e:Event):void{
			_right++;
			if(_right==4){
				endGame();
			}
		}
	}
}
