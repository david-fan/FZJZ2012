package EQ {
	import com.david.ui.MButton;
	import com.david.ui.MImage;
	import com.david.ui.MMachineTextBlock;
	import com.david.ui.core.MSprite;
	
	import selib.GameTimer;

	/**
	 * @author david
	 */
	public class Menu extends MSprite {
		public var record : MButton;
		public var time : GameTimer;
		public var perons :MMachineTextBlock;
//		public var shovel : MButton;
//		public var doctor : MButton;

		public function Menu() {
			var bg : MImage = new MImage("EQ/asset/BtnBG.png");
			addChild(bg);
			record = new MButton(new MImage("asset/recordBtn.png"));
			addChildXY(record, 96, 15);
			time = new GameTimer();
			addChildXY(time, 296, 25);
			perons = new MMachineTextBlock("7",20,0xffffff);
			addChildXY(perons, 296, 80);
//			shovel = new MButton(new MImage("EQ/asset/shovel.png"));
//			addChildXY(shovel, 680, 30);
//			doctor = new MButton(new MImage("EQ/asset/doctor.png"));
//			addChildXY(doctor, 924, 30);
//			doctor.visible = false;
		}
	}
}
