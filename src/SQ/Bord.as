package SQ
{
	import flash.text.engine.FontWeight;
	import com.david.ui.MBox;
	import com.david.ui.MCheckBox;
	import com.david.ui.MDirection;
	import com.david.ui.MStrokeMachineText;
	import com.david.ui.MTile;
	import com.david.ui.core.MSprite;
	
	public class Bord extends MSprite
	{
		private var _question:MStrokeMachineText;
		private var _tile:MBox;
		public function Bord()
		{
			super();
			_question=new MStrokeMachineText("",22,0xff00ff,500,0xffff00,"SimHei",FontWeight.BOLD);
			this.addChildXY(_question,20,20);
			
		}
		
		public function SetData(value:Question):void{
			_question.text=value.title;
			if(_tile&&this.contains(_tile))
				this.removeChild(_tile);
			if(value.type==1){
				_tile=new MBox(false,MDirection.Vertical,10,false);
				for each(var item:Object in value.answers){
					var ti:TxtItem=new TxtItem(item.a,item.r);
					_tile.addChild(ti);
				}
			}
			else
			{
				_tile=new MBox(false,MDirection.Horizon,10,false);
				for each(var item:Object in value.answers){
					var ii:ImgItem=new ImgItem(item.a,item.r);
					_tile.addChild(ii);
				}
			}this.addChildXY(_tile,40,60);
		}
		
		public function getCurrentQuestionOK():Boolean{
			var ok:Boolean=true;
			while(_tile.numChildren>0){
				var c:IAnswer = _tile.removeChildAt(0) as IAnswer;
				ok&&=c.ok;
			}
			return ok;
		}
	}
}