package
{
	import flash.events.GeolocationEvent;
	import flash.sensors.Geolocation;

	public class LocationManager
	{
		private var geo:Geolocation;
		private var callback_onUpdated:Function;
		public var currentPosition:GeoPosition;
		public var debug:Boolean=false;
		
		public static const ST_GEO_READY:String = "ST_GEO_READY";
		public static const ST_GEO_NOT_SUPPORTED:String = "ST_GEO_NOT_SUPPORTED";
		public static const ST_GEO_MUTTED:String = "ST_GEO_MUTTED";
		public var state:String = LocationManager.ST_GEO_READY;
		
		public function LocationManager()
		{
		}
		
		public function initialize(callback_onUpdated:Function=null):void
		{
			this.callback_onUpdated = callback_onUpdated;
			currentPosition = new GeoPosition;
			validateStateAndCallFunction( updateCurrentLocation );
		}
		
		public function updateCurrentLocation():void
		{
			geo.setRequestedUpdateInterval(Config.timeToUpdateLocation);
			//Register to receive location updates.
			geo.addEventListener(GeolocationEvent.UPDATE, geolocationUpdateHandler);
		}
		
		private function geolocationUpdateHandler(event:GeolocationEvent):void
		{
			currentPosition.fromGeoLocationEvent(event);
			callback_onUpdated(currentPosition);
		}		
		
		private function validateStateAndCallFunction( functionToCall:Function, params:Array=null ):void
		{
			if (Geolocation.isSupported)
			{
				//Initialize the location sensor.
				geo = new Geolocation();
				if(! geo.muted)
				{
					if(params){
						functionToCall( params );
					} else {
						functionToCall();
					}
				} else {
					updateState(LocationManager.ST_GEO_MUTTED);
				}
			} else {
				updateState(LocationManager.ST_GEO_NOT_SUPPORTED);
			}
		}
		
		private function updateState(newState:String):void
		{
			state = newState;
			if(state!=LocationManager.ST_GEO_READY)
			{
				callback_onUpdated(null);
				if(debug)
				{
					trace("### ERROR:" + state);
				}
			}
		}
		
	}
}