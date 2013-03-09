package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	
	import cl.pcornejo.gmaps.LatLng;
	import cl.pcornejo.gmaps.Map;
	import cl.pcornejo.gmaps.MapOptions;
	import cl.pcornejo.gmaps.MapType;
	import cl.pcornejo.gmaps.events.MapsEvents;
	import cl.pcornejo.gmaps.events.MarkerEvents;
	import cl.pcornejo.gmaps.overlays.Marker;
	import cl.pcornejo.gmaps.overlays.MarkerOptions;

	public class MapController extends Sprite
	{
		private var gmap:Map;
		public var mainStage:Stage;
		
		public function MapController()
		{
		}
		
		public function initialize(mainStage:Stage):void
		{
			this.mainStage = mainStage;
			configMap();
		}
		
		private function configMap():void
		{
			var mopts:MapOptions = new MapOptions();
			mopts.center = new LatLng(-34.52, -58.48); //Required
			mopts.zoom = 15; //Required
			mopts.mapTypeId = MapType.ROADMAP; //Required
			mopts.mapTypeControl = false; //Optional
			mopts.streetViewControl = false; //Optional
			
			gmap = new Map(mopts);
			gmap.viewport = new Rectangle(0, 0, mainStage.stageWidth, mainStage.stageHeight);
			gmap.addEventListener(MapsEvents.MAP_READY, gmapReady);
			addChild(gmap);
			
		}
		
		protected function gmapReady(event:MapsEvents):void
		{
			trace("Map Ready");
			addMarker();
		}
		
		private function addMarker():void
		{
			var markopts:MarkerOptions = new MarkerOptions();
			markopts.position = new LatLng(-39, -77); //Required
			markopts.map = gmap; //Required
			
			var mark:Marker = new Marker(markopts);
			mark.addEventListener(MarkerEvents.ADDED, markerAdded);
			mark.addEventListener(MarkerEvents.CLICK, clickMarker);
		}
		
		protected function clickMarker(event:MarkerEvents):void
		{
			trace("Click/Touch Marker");
		}
		
		protected function markerAdded(event:MarkerEvents):void
		{
			trace("Marker Added");
		}
		
	}
}