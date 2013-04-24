package pazu.display3D;


import flash.display3D.Context3DProgramType;
import pazu.gl.GL;
import pazu.gl.GLShader;


abstract Shader3D (GLShader) {
	
	
	public function new (source:String, type:Context3DProgramType) {
		
		this = GL.createShader (type == Context3DProgramType.VERTEX ? GL.VERTEX_SHADER : GL.FRAGMENT_SHADER);
		
		GL.shaderSource (this, source);
		GL.compileShader (this);
		
		if (GL.getShaderParameter (this, GL.COMPILE_STATUS) == 0) {
			
			trace("--- ERR ---\n" + source);
			var err = GL.getShaderInfoLog (this);
			if (err != "") throw err;
			
		}
		
	}
	
	
	@:to public inline function toGLShader ():GLShader {
		
		return this;
		
	}
	
	
}