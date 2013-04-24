package flash.display3D.textures;
#if js


import flash.display.BitmapData;
import flash.utils.ByteArray;
import pazu.gl.GL;
import pazu.gl.GLTexture;


class RectangleTexture extends TextureBase {


    public function new (glTexture:GLTexture) {

        super (glTexture);

    }

	
	
	public function uploadFromBitmapData(source:BitmapData):Void {
		
		// TODO
		
	}
	
	
	public function uploadFromByteArray(data:ByteArray, byteArrayOffset:Int):Void {
		
		// TODO
		
	}
	
	
}


#end