package SQ
{
	import com.david.ui.MButton;
	import com.david.ui.MLabelButton;
	import com.david.ui.core.MSprite;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class SelectQuestion extends MSprite
	{
		private var bord:Bord;
		private var datas:Array=[];
		private var dataIndex:int=0;
		private var submitBtn:MButton;
		public function SelectQuestion()
		{
			super();
			bord=new Bord();
			this.addChild(bord);
			
			var q:Question=new Question("家中发生煤气泄漏后，怎么做是正确的呢？");
			q.addAnswer("打电话报警",false);
			q.addAnswer("打开风扇换气",false);
			q.addAnswer("打开窗户，大声呼救",true);
			q.addAnswer("用湿毛巾捂住口鼻蹲下弯腰逃出",true);
			q.addAnswer("稳定情绪，保持清醒",true);
			datas.push(q);
			
			q=new Question("食品标签中必须包含哪些项目？");
			q.addAnswer("产品名称",true);
			q.addAnswer("配料表",true);
			q.addAnswer("生产日期",true);
			q.addAnswer("保质期",true);
			q.addAnswer("厂名厂址",true);
			q.addAnswer("净含量",true);
			datas.push(q);
			
			q=new Question("购买食品时，看看必须有哪个标识呢？",2);
			q.addAnswer("SQ/get1.jpg",true);
			q.addAnswer("SQ/get2.jpg",true);
			q.addAnswer("SQ/get3.jpg",true);
			q.addAnswer("SQ/get4.jpg",true);
			datas.push(q);
			
			submitBtn=new MLabelButton("提交",new Asset.submit(),18);
			this.addChildXY(submitBtn,500,600);
			submitBtn.addEventListener(MouseEvent.CLICK,onSubmit);
			playIndex();
		}
		private function playIndex():void{
			bord.SetData(datas[dataIndex]);
			dataIndex++;
		}
		private function onSubmit(e:MouseEvent):void{
			var ok:Boolean=bord.getCurrentQuestionOK();
			trace(ok);
			playIndex();
		}
	}
}