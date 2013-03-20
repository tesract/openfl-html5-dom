package flash.display;
#if js


import flash.display.IGraphicsData;
import flash.display.IGraphicsFill;
import flash.utils.UInt;


class GraphicsSolidFill implements IGraphicsData implements IGraphicsFill {
	
	
	public var alpha:Float;
	public var color:UInt;
	public var nmeGraphicsDataType(default,null):GraphicsDataType;
	public var nmeGraphicsFillType(default,null):GraphicsFillType;
	
	
	public function new(color:UInt = 0, alpha:Float = 1) {
		
		this.alpha = alpha;
		this.color = color;
		this.nmeGraphicsDataType = SOLID;
		this.nmeGraphicsFillType = SOLID_FILL;
		
	}
	
	
}


#end