Shader "Custom/deformShader2" {
	SubShader {
		Pass{
		
		CGPROGRAM
// Upgrade NOTE: excluded shader from OpenGL ES 2.0 because it does not contain a surface program or both vertex and fragment programs.
#pragma exclude_renderers gles
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"
		
		struct v2f {
			float4 pos : SV_POSITION;
			float3 color : COLOR0;
			};

		
		v2f vert(appdata_base v)
		{
			v2f result = (v2f)(0);
			float h = (sin(v.vertex.x*1000.0) + sin(v.vertex.z*1000.0) + (sin(v.vertex.x*0.1*10.0) + sin(v.vertex.z*0.1*10.0))*4.0) * abs(sin(v.vertex.x*0.01) + sin(v.vertex.z*0.01));
				
			result.pos = mul(UNITY_MATRIX_MVP,float4(_Object2World[3].xyz + v.vertex + float3(0,h,0),1.0));
			result.color = float3(v.texcoord.xy,h*0.25 + 0.5);
			//v.normal*0.5+0.5;
			return result;
		}
		
		half4 frag(v2f input) : COLOR
		{
			return half4(input.color,1.0);
		}
	
		ENDCG
		}
	} 
	FallBack "VertexLit"
}
