package SQ
{
	import com.david.ui.MBox;
	import com.david.ui.MCheckBox;
	import com.david.ui.MDirection;
	import com.david.ui.MImage;
	
	public class ImgItem extends AnswerItem implements IAnswer
	{
		private var cb:MCheckBox;
		private var r:Boolean;
		public var img:MImage;
		public function ImgItem(url:String,r:Boolean,sound:String="")
		{
            super(sound);
			cb=new MCheckBox(new Asset.cbbg(),new Asset.cbc());
			img=new MImage(url);
			this.addChild(img);
			this.addChild(cb);
			this.r=r;
		}
		
		public function get ok():Boolean{
			return cb.checked==r;
		}
	}
}