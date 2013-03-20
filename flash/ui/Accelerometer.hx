package flash.ui;
#if js


import flash.display.Stage;


class Accelerometer {
	
	
	public static function get():Acceleration {
		
		return Stage.nmeAcceleration;
		
	}
	
	
}


#end