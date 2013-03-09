package
{
	import flash.events.GeolocationEvent;

	public class GeoPosition
	{
		public var latitude:Number = 0;				// Degrees
		public var longitude:Number = 0;			// Degrees
		public var altitude:Number = 0;				// Meters
		public var horizontalAccuracy:Number = 0;	// Meters
		public var verticalAccuracy:Number = 0;		// Meters
		public var speed:Number = 0;				// Meters/Seconds
		public var timestamp:Number = 0;			// Milliseconds
		
		public function GeoPosition()
		{
		}
		
		public function fromGeoLocationEvent(event:GeolocationEvent):void
		{
			this.latitude = event.latitude;
			this.longitude = event.longitude;
			this.horizontalAccuracy = event.horizontalAccuracy;
			this.timestamp = event.timestamp;
		}

		public function stringfy():String
		{
			return "lat:" + latitude.toString() + " long:" + longitude.toString() + " Acc:" + horizontalAccuracy.toString();
		}
	}
}