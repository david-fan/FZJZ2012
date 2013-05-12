package PS
{
	import com.david.ui.MImage;
	import com.david.ui.core.MSprite;
	
	import flash.utils.setTimeout;
	
	import util.FinishAlert;

	public class PictureSelect extends MSprite
	{
		public function PictureSelect()
		{
			var i:int=Math.ceil(20*Math.random());
				var img:MImage=new MImage("PS/asset/"+(i<10?"0"+i:i)+".jpg");
				this.addChild(img);
				setTimeout(show,20*1000);
		}
		
		private function show():void{
			FinishAlert.showWithoutTop5(this);
		}
	}
}