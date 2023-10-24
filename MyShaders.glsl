// ***************************
// Shader programs to be used in conjunction with the
//  Phong lighting shaders of EduPhong.glsl
// Are first used with Project #6, Math 155A, Winter 2019
//
// Revision: Feb 23, 2019
// ***************************

// #beginglsl ...  #endglsl mark begining and end of code blocks.
// Syntax for #beginglsl is:
//
//   #beginglsl <shader-type> <shader-code-name>
//
// where <shader-type> is
//      vertexshader or fragmentshader or geometryshader or codeblock,
// and <shader-code-name> is used to compile/link the shader into a 
//      shader program.
// A codeblock is meant to be used as	 a portion of a larger shader.

// *****************************
// applyTextureMap - code block
//    applyTextureMap() is called after the Phong lighting is calculated.
//        - It returns a vec4 color value, which is used as the final pixel color.
//    Inputs: (all global variables)
//        - nonspecColor and specularColor (global variables, vec3 objects)
//        - theTexCoords (the texture coordinates, a vec2 object)
//    Returns a vec4:
//       - Will be used as the final fragment color
// *****************************
#beginglsl codeblock MyProcTexture
// vec3 nonspecColor;		// These items already declared 
// vec3 specularColor;
// vec2 theTexCoords;

uniform sampler2D theTextureMap;	// An OpenGL texture map

vec4 applyTextureFunction() {
	vec2 wrappedTexCoords = fract(theTexCoords);	// Wrap s,t to [0,1].
	float x=wrappedTexCoords.x-0.5;
	float y=wrappedTexCoords.y-0.5;
	if (pow(x,2)+pow(y,2)<=pow(0.5,2)){	
		if(y>0){
			if(pow(x-0.25,2)+pow(y-0.25,2)<=pow(0.12,2)){
				return vec4( 1.0, 1.0, 0.0, 1 );
			}
			else{
				return vec4( 0.5, 0.5, 0.5, 1 );
			}
		}
		else{
			return vec4(0.5,0.5,1+y,1);
		}
	}
	else {
		return vec4(0,1,1,1);
	}
}

#endglsl
