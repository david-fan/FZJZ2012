package util
{
	import com.david.ui.MLabelButton;
	import com.david.ui.MMachineTextBlock;
	import com.david.ui.core.MSprite;
	import com.greensock.*;
	
	import flash.desktop.*;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.*;

	public class FinishAlert extends MSprite
	{
		[Embed(source='/asset/girlSwf.swf')]
		public var girlSwf:Class;
		[Embed(source='/asset/lastBg.jpg')]
		public var last:Class;
		[Embed(source='/asset/sureBtn.png')]
		public var sureBtn:Class;
		[Embed(source='/asset/tipBG.swf')]
		public var tipBG:Class;
		
		private var _txt:MMachineTextBlock;
		
		public function FinishAlert()
		{
			this.addChildXY(new tipBG(),480,250);
			var girl:DisplayObject=new girlSwf();
			girl.scaleX=girl.scaleY=3;
			this.addChildXY(girl,230,290);
			
			var sure:MLabelButton = new MLabelButton("确认", new sureBtn(), 22);
			this.addChildXY(sure, 450, 350);
			sure.addEventListener(MouseEvent.CLICK, this.onSure);
			this._txt = new MMachineTextBlock("", 30, 16777215, 350);
			this.addChildXY(this._txt, 380, 250);
		}
		
		private function onSure(event:MouseEvent) : void
		{
			var l:DisplayObject = new last();
			l.alpha = 0;
			this.removeAllChildren();
			this.addChild(l);
			TweenLite.to(l, 3, {alpha:1, onComplete:this.exit});
			return;
		}// end function
		
		private function exit() : void
		{
			setTimeout(function () : void
			{
				NativeApplication.nativeApplication.exit();
				return;
			}// end function
				, 3000);
		}// end function
		
		public static function showWithoutTop5(container:DisplayObjectContainer) : void
		{
			var _loc_2:* = new FinishAlert;
			_loc_2._txt.text = "欢迎使用！";
			container.addChild(_loc_2);
			return;
		}// end function
		
		public static function show(top5:Boolean, container:DisplayObjectContainer) : void
		{
			var alert:FinishAlert = new FinishAlert();
			if (top5)
			{
				alert._txt.text = "恭喜你进入前5名！";
			}
			else
			{
				alert._txt.text = "继续努力！";
			}
			container.addChild(alert);
			return;
		}// end function
	}
}