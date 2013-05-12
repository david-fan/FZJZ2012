package {
	import AC.AnimalCrazy;
	
	import EQ.Earthquake;
	
	import FS.FoodSelect;
	
	import JT.JTAQ;
	
	import MG.DZMG;
	
	import PS.PictureSelect;
	
	import SQ.SelectQuestion;
	
	import WF.WaterFire;
	
	import com.david.ui.MDirection;
	import com.david.ui.MLabelButton;
	import com.david.ui.MTile;
	import com.david.ui.core.AppLayer;
	import com.david.ui.core.MSprite;
	
	import flash.desktop.NativeApplication;
	import flash.display.Loader;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.NativeWindowBoundsEvent;
	import flash.ui.Keyboard;
	
	/**
	 * @author david
	 */
	public class FZJZ2012 extends MSprite {
		private var _tile : MTile;
		private var _container : MSprite;
		
		public function FZJZ2012() {
			super();
			
			stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;
			stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,onResize);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			
			AppLayer.init(this);
			AppLayer.AppWidth = 1024;
			AppLayer.AppHeight = 768;
//			//
//			_tile = new MTile(MDirection.Horizon, 1, 10);
//			addChildXY(_tile, 150, 150);
//			
//			var acBtn : MLabelButton = new MLabelButton("动物也疯狂");
//			acBtn.addEventListener(MouseEvent.CLICK, onACClick);
//			_tile.addChild(acBtn);
//			
//			var eqBtn : MLabelButton = new MLabelButton("极速救援");
//			eqBtn.addEventListener(MouseEvent.CLICK, onEQClick);
//			_tile.addChild(eqBtn);
//			
//			var wfBtn : MLabelButton = new MLabelButton("水与火");
//			wfBtn.addEventListener(MouseEvent.CLICK, onWFClick);
//			_tile.addChild(wfBtn);
//			
//			var nfBtn : MLabelButton = new MLabelButton("食物收集");
//			nfBtn.addEventListener(MouseEvent.CLICK, onFNClick);
//			_tile.addChild(nfBtn);
//			
//			var mgBtn : MLabelButton = new MLabelButton("地震迷宫");
//			mgBtn.addEventListener(MouseEvent.CLICK, onMGClick);
//			_tile.addChild(mgBtn);
//			
//			var jtBtn : MLabelButton = new MLabelButton("交通安全");
//			jtBtn.addEventListener(MouseEvent.CLICK, onJTClick);
//			_tile.addChild(jtBtn);
//			
//			var psBtn : MLabelButton = new MLabelButton("图片选择");
//			psBtn.addEventListener(MouseEvent.CLICK, onPSClick);
//			_tile.addChild(psBtn);
			
			_container = new MSprite();
			AppLayer.SceneLayer.addChild(_container);
			
			//var acts:Array=[onJTClick,onMGClick,onFNClick,onACClick,onEQClick,onWFClick,onPSClick];
			var acts:Array=[onPSClick];
			var index:int=Math.floor(acts.length*Math.random());
			(acts[index] as Function).apply(this,[null]);
			
			onResize(null);
		}
		private function onSQClick(e:MouseEvent):void{
			_container.removeAllChildren(true);
			var sq :SelectQuestion = new SelectQuestion();
			_container.addChild(sq);
		}
		private function onJTClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var jt : JTAQ = new JTAQ();
			_container.addChild(jt);
		}
		
		private function onMGClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var mg : DZMG = new DZMG();
			_container.addChild(mg);
		}
		
		private function onFNClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var fs : FoodSelect = new FoodSelect();
			_container.addChild(fs);
		}
		
		private function onACClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var ac : AnimalCrazy = new AnimalCrazy();
			_container.addChild(ac);
		}
		
		private function onEQClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var eq : Earthquake = new Earthquake();
			_container.addChild(eq);
		}
		
		private function onWFClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var wf : WaterFire = new WaterFire();
			_container.addChild(wf);
		}
		
		private function onPSClick(e : MouseEvent) : void {
			_container.removeAllChildren(true);
			var ps :PictureSelect = new PictureSelect();
			_container.addChild(ps);
		}
		
		private function onResize(e:NativeWindowBoundsEvent):void{
			_container.x=(stage.nativeWindow.width-1024)/2;
			_container.y=(stage.nativeWindow.height-768)/2;
			
			AppLayer.AppWidth=stage.nativeWindow.width;
			AppLayer.AppHeight=stage.nativeWindow.height;
		}
		
		private function onKeyDown(e:KeyboardEvent):void{
			if (e.keyCode == Keyboard.ESCAPE) {
				e.preventDefault();
			}
		}
	}
}
