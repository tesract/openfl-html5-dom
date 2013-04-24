package flash.display;
#if js


import flash.display3D.Context3D;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import pazu.display.OpenGLView;


class Stage3D extends EventDispatcher {
	
	
	public var context3D:Context3D;
	public var visible:Bool; // TODO
	public var x:Float; // TODO
	public var y:Float; // TODO
	
	
	public function new() {
		
		super();
		
	}
	
	
	public function requestContext3D(context3DRenderMode:String = ""):Void {

		if (OpenGLView.isSupported) {
		    context3D = new Context3D();
		    dispatchEvent(new Event(Event.CONTEXT3D_CREATE));
		}else{
            dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
		}
		
	}
	
	
}


#end