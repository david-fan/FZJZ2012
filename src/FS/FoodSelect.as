package FS {
	import com.david.ui.MButton;
	import com.david.ui.MDirection;
	import com.david.ui.MImage;
	import com.david.ui.MTile;
	import com.david.ui.core.MSprite;
	import com.david.util.UtilManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import selib.GameTimer;
	import selib.Record;
	import selib.RecordUtil;
	import selib.SoundUtil;
	import selib.ui.RecordUI;
	
	import util.FinishAlert;

	/**
	 * @author david
	 */
	public class FoodSelect extends MSprite {
		private var _recordUI : RecordUI = RecordUI.getInstance("fs_record");
		private var _nfs1 : MTile = new MTile(MDirection.Horizon, 10, 5);
		private var _nfs2 : MTile = new MTile(MDirection.Horizon, 10, 5);
		private var _timer : GameTimer;
		private var _records : XML;
		private var _right:int;

		public function FoodSelect() {
			super();
			addChild(new MImage("FS/asset/foodbg.png"));
			//
			addChildXY(new NFItem("FS/asset/zhu.swf"), 118, 400);
			addChildXY(new NFItem("FS/asset/mogu.swf"), 970, 530);
			addChildXY(new NFItem("FS/asset/baicai.swf"), 554, 530);
			addChildXY(new NFItem("FS/asset/gua.swf"), 241, 562);
			addChildXY(new NFItem("FS/asset/guozi.swf"), 512, 467);
			addChildXY(new NFItem("FS/asset/jirou.swf"), 752, 514);
			addChildXY(new NFItem("FS/asset/mianbao.swf"), 334, 590);
			addChildXY(new NFItem("FS/asset/nailao.swf"), 74, 496);
			addChildXY(new NFItem("FS/asset/xigua.swf"), 251, 513);
			addChildXY(new NFItem("FS/asset/yu.swf"), 125, 590);
			//
			addChildXY(new MImage("FS/asset/yes.swf"), 0, 186);
			//
			addEventListener(NFItem.FoodSelect, onFS);

			for (var i : int = 0; i <10; i++) {
				_nfs1.addChild(new MImage("FS/asset/nstart.png"));
			}
			var fx : int = 420;
			var fy : int = 685;
			addChildXY(_nfs1, fx, fy);
			addChildXY(_nfs2, fx, fy);
			//
			var _record : MButton = new MButton(new MImage("asset/recordBtn.png"));
			addChildXY(_record, 80, 690);

			_record.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});
			//
			_timer = new GameTimer(24);
			addChildXY(_timer, 240, 700);
			
			//
			SoundUtil.PlaySound("FS/asset/swsj.mp3", int.MAX_VALUE);

			var m : MButton = new MButton(new MImage("FS/asset/swsj.jpg"));
			m.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				_timer.start();
				removeChild(m);
			});
			addChild(m);
			//
			_records = RecordUtil.readRecord("swsj.xml");
			_recordUI.setSource(_records);
		}
		
		public function endGame() : void {
			_timer.stop();
			var record:Record=RecordUtil.ReturnTop5Record(_records,_timer.time);
			if(record.top5){
				RecordUtil.saveRecord("swsj.xml",record.records);
			}FinishAlert.show(record.top5,this);
		}

		private function onFS(e : Event) : void {
			e.stopPropagation();
			var nfi : NFItem = e.target as NFItem;
			removeChild(nfi);
			_nfs2.addChild(new MImage("FS/asset/ystart.png"));
			_right++;
			if(_right==10){
				endGame();
			}
		}
	}
}
