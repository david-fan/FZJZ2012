package SQ
{
	public class Question
	{
		public var title:String;
		public var answers:Array=[];
		public var type:int;
		public function Question(title:String,type:int=1)
		{
			this.title=title;
			this.type=type;
		}
		
		public function addAnswer(answer:String,right:Boolean,sound:String=""):void{
			this.answers.push({a:answer,r:right,s:sound});
		}
	}
}