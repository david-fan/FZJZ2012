package AC{
	import com.david.ui.core.MSprite;
	import com.david.ui.core.MUIComponent;

	import org.casalib.events.LoadEvent;
	import org.casalib.load.GroupLoad;
	import org.casalib.load.SwfLoad;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	/**
	 * @author david
	 */
	public class BaseItem extends MUIComponent {
		private var _container : MSprite;
		[Embed(source="asset/mask.swf")]
		private var maskPng : Class;
		[Embed(source="asset/border.png")]
		private var borderPng : Class;
		//
		private var _animalUrl : String;
		private var _animalSwf:MovieClip;
		private var _ax : int;
		private var _ay : int;
		private var _backgroudUrl : String;

		public function BaseItem(animalUrl : String, backgroudUrl : String, ax : int, ay : int) {
			super(false);
			//
			_animalUrl = animalUrl;
			_backgroudUrl = backgroudUrl;
			_ax = ax;
			_ay = ay;
			//
			this.buttonMode = true;
			this.useHandCursor = true;
			_container = new MSprite();
			var mask : DisplayObject = new maskPng();
			addChild(mask);
			mask.x = mask.y = 5;
			_container.mask = mask;
			addChild(_container);
			addChild(new borderPng());
			
		}
		
		public function start():void{
			var gl : GroupLoad = new GroupLoad();
			gl.addLoad(new SwfLoad(_animalUrl));
			gl.addLoad(new SwfLoad(_backgroudUrl));
			gl.addEventListener(LoadEvent.COMPLETE, onLoadComplete);
			gl.start();
		}
		
		public function stop():void{
			_animalSwf.loaderInfo.loader.unloadAndStop();
		}

		private function onLoadComplete(e : LoadEvent) : void {
			var gl : GroupLoad = e.target as  GroupLoad;
			var backgroudpng : SwfLoad = gl.getLoad(_backgroudUrl) as SwfLoad;
			_container.addChild(backgroudpng.content);
			var animal : SwfLoad = gl.getLoad(_animalUrl) as SwfLoad;
			_animalSwf = animal.contentAsMovieClip;
			_animalSwf.x = _ax;
			_animalSwf.y = _ay;
			_container.addChild(_animalSwf);
			gl.destroy();
		}
	}
}
