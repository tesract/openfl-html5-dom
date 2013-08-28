package openfl.display;
#if js


import flash.display.BitmapData;
import flash.display.Graphics;
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
	public static inline var TILE_BLEND_MULTIPLY = 0x00020000;
	public static inline var TILE_BLEND_SCREEN = 0x00040000;
	
	/** @private */ public var nmeBitmap:BitmapData;
	/** @private */ public var nmeCenterPoints:Array <Point>;
	/** @private */ public var nmeTileRects:Array <Rectangle>;
	/** @private */ public var nmeTileUVs:Array <Rectangle>;
	
	
	public function new(image:BitmapData) {
		
		nmeBitmap = image;
		nmeCenterPoints = new Array <Point>();
		nmeTileRects = new Array <Rectangle>();
		nmeTileUVs = new Array <Rectangle>();
		
	}
	
	
	public function addTileRect(rectangle:Rectangle, centerPoint:Point = null):Int {
		
		nmeTileRects.push(rectangle);
		
		if (centerPoint == null) {
			
			centerPoint = new Point();
			
		}
		
		nmeCenterPoints.push(centerPoint);
		nmeTileUVs.push(new Rectangle(rectangle.left / nmeBitmap.width, rectangle.top / nmeBitmap.height, rectangle.right / nmeBitmap.width, rectangle.bottom / nmeBitmap.height));
		
		return nmeTileRects.length - 1;
		
	}
	
	
	public function drawTiles(graphics:Graphics, tileData:Array<Float>, smooth:Bool = false, flags:Int = 0):Void {
		
		graphics.drawTiles(this, tileData, smooth, flags);
		
	}
	
	public inline function getTileCenter(index:Int):Point {
		return nmeCenterPoints[index];
	}
	
	public inline function getTileRect(index:Int):Rectangle {
		return nmeTileRects[index];
	}
	
	public inline function getTileUVs(index:Int):Rectangle {
		return nmeTileUVs[index];
	}
	
	
}


#end
