Shader "Custom/deformShader" {
	SubShader {
		Pass{
		
		CGPROGRAM
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
			float beta = (v.texcoord.y-0.5) * 3.14159*0.5;
			float alpha = (v.texcoord.x) * 2.0 * 3.14159;
			float h = sin(beta),
				r = cos(beta),
				x = cos(alpha)*r,
				y = sin(alpha)*r;
			float radius = 100.0 + v.vertex.y;
				
			result.pos = mul(UNITY_MATRIX_MVP,float4(_Object2World[3].xyz + float3(x,h,y)*radius + float3(50,0,50),1.0));
			result.color = float3(v.texcoord.xy,0.0);
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
