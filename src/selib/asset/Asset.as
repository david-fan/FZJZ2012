package selib.asset {
	/**
	 * @author david
	 */
	public class Asset {
		[Embed(source="/selib/asset/rule.swf")]
		public static var ruleClass : Class;
		[Embed(source="/selib/asset/recordBG.png")]
		public static var recordClass : Class;
		[Embed(source="/selib/asset/closeBtn.swf")]
		public static var closeBtnClass : Class;
		[Embed(source="/selib/asset/timeIcon.png")]
		public static var timeIcon : Class;
	}
}
