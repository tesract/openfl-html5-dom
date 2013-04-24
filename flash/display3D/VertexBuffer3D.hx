package flash.display3D;
#if js


import flash.utils.ByteArray;
import flash.Vector;
import pazu.gl.GL;
import pazu.gl.GLBuffer;
import pazu.utils.ArrayBuffer;
import pazu.utils.Float32Array;


class VertexBuffer3D {
	
	
	public var data32PerVertex:Int;
	public var glBuffer:GLBuffer;
	public var numVertices:Int;
	
	
	public function new(glBuffer:GLBuffer, numVertices:Int, data32PerVertex:Int) {
		
		this.glBuffer = glBuffer;
		this.numVertices = numVertices;
		this.data32PerVertex = data32PerVertex;
		
	}

	public function dispose ():Void {
		GL.deleteBuffer(glBuffer);
	}
	
	
	public function uploadFromByteArray (byteArray:ByteArray, byteArrayOffset:Int, startOffset:Int, count:Int):Void {
		var bytesPerVertex = data32PerVertex * 4;
        GL.bindBuffer (GL.ARRAY_BUFFER, glBuffer);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(untyped byteArray.byteView.buffer,byteArrayOffset + startOffset * bytesPerVertex, count * bytesPerVertex), GL.STATIC_DRAW);
	}
	
	
	public function uploadFromVector (data:Vector<Float>, startVertex:Int, numVertices:Int):Void {
        GL.bindBuffer (GL.ARRAY_BUFFER, glBuffer);
		if (startVertex == 0 && numVertices * data32PerVertex == data.length) {
			GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (data), GL.STATIC_DRAW);
		} else {
			var vertices = data.splice (startVertex, numVertices * data32PerVertex);
			GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (vertices), GL.STATIC_DRAW);
		}
	}
	
	
}


#end