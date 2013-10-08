package flash.display;


import flash.geom.Point;
import flash.geom.Rectangle;


class Tilesheet {
	
	
	public static inline var TILE_SCALE = 0x0001;
	public static inline var TILE_ROTATION = 0x0002;
	public static inline var TILE_RGB = 0x0004;
	public static inline var TILE_ALPHA = 0x0008;
	public static inline var TILE_TRANS_2x2 = 0x0010;
	public static inline var TILE_BLEND_NORMAL   = 0x00000000;
	public static inline var TILE_BLEND_ADD      = 0x00010000;
	
	/** @private */ public var __bitmap:BitmapData;
	/** @private */ public var __centerPoints:Array <Point>;
	/** @private */ public var __tileRects:Array <Rectangle>;
	
	
	public function new (image:BitmapData) {
		
		__bitmap = image;
		__centerPoints = new Array <Point> ();
		__tileRects = new Array <Rectangle> ();
		
	}
	
	
	public function addTileRect (rectangle:Rectangle, centerPoint:Point = null):Int {
		
		__tileRects.push (rectangle);
		
		if (centerPoint == null) {
			
			centerPoint = new Point ();
			
		}
		
		__centerPoints.push (centerPoint);
		
		return __tileRects.length - 1;
		
	}
	
	
	public function drawTiles (graphics:Graphics, tileData:Array<Float>, smooth:Bool = false, flags:Int = 0):Void {
		
		graphics.drawTiles (this, tileData, smooth, flags);
		
	}
	
	
}