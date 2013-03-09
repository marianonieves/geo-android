package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(width="1024",height="768",frameRate="60", backgroundColor="#000000")]
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
			var main:Sprite = new MainOriginal() as Sprite;
			stage.addChildAt(main,0);
		}
	}
}