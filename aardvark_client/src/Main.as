package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	
	/**
	 * ...
	 * @author Niels van Hecke
	 */
	public class Main extends Sprite
	{
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// create socket to talk to server
			var socket:Socket = new Socket();
			socket.addEventListener(Event.CLOSE, closed)
			socket.addEventListener(Event.CONNECT, connect);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, data);
			
			socket.connect("localhost", 1234);
			
			trace("this is the entry point.");
			//stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function data(e:Event):void 
		{
			trace(e);
		}
		
		private function securityError(e:Event):void 
		{
			trace(e);
		}
		
		private function ioError(e:Event):void
		{
			trace(e);
		}
		
		private function connect(e:Event):void
		{
			trace("connected!");
		}
		
		private function closed(e:Event):void
		{
			trace("closed");
		}
		
		public function onEnterFrame(e:Event):void
		{
		
		}
	
	}

}