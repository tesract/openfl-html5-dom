package flash.display3D;
#if js


import flash.utils.ByteArray;
import flash.Vector;
import pazu.gl.GL;
import pazu.gl.GLBuffer;
import pazu.utils.Int16Array;


class IndexBuffer3D {
	
	
	public var glBuffer:GLBuffer;
	public var numIndices:Int;
	
	

	public function new (glBuffer:GLBuffer, numIndices:Int) {

		this.glBuffer = glBuffer;
		this.numIndices = numIndices;
		
	}
	

	public function uploadFromByteArray (byteArray:ByteArray, byteArrayOffset:Int, startOffset:Int, count:Int):Void {
        var bytesPerIndex = 2;
		GL.bindBuffer (GL.ELEMENT_ARRAY_BUFFER, glBuffer);
		var indices = new Int16Array(untyped byteArray.byteView.buffer,byteArrayOffset + startOffset* bytesPerIndex, count* bytesPerIndex);
		GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, indices, GL.STATIC_DRAW);
	}
	
	
	public function uploadFromVector (data:Vector<Int>, startOffset:Int, count:Int):Void {
        GL.bindBuffer (GL.ELEMENT_ARRAY_BUFFER, glBuffer);
		if (startOffset == 0 && count == data.length) {
			GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, new Int16Array(data), GL.STATIC_DRAW);
		} else {
			var vertices = data.splice (startOffset, count);
			GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, new Int16Array(vertices), GL.STATIC_DRAW);
		}
	}

    public function dispose ():Void {
        GL.deleteBuffer(glBuffer);
    }

}


#end