package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(width="480",height="800",frameRate="30", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			
			init();
		}
		
		private function init():void{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initialize();
		}
		
		protected function initialize():void
		{
			var main:MainOriginal = new MainOriginal(stage);
			stage.addChildAt(main,0);
		}
	}
}