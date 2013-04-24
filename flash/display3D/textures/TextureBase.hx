package flash.display3D.textures;
#if js


import flash.geom.Rectangle;
import flash.utils.ByteArray;
import flash.display.BitmapData;
import flash.events.EventDispatcher;
import pazu.gl.GL;
import pazu.gl.GLTexture;


class TextureBase extends EventDispatcher {
	
	
    public var glTexture:GLTexture;
	

	public function new(glTexture:GLTexture) {
		
		super ();
		
        this.glTexture = glTexture;
		
    }
	
	
	public function dispose():Void {
		
        GL.deleteTexture(glTexture);
		
	}
	
	
}


#end