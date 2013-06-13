Shader "Custom/Fancy" {
	Properties {
		_Base ("Base (RGB)", 2D) = "white" {}
		_Overlay ("Overlay (RGBA)", 2D) = "white" {}
		_BaseShininess ("BaseShininess", Range(0,1)) = 0.0
		_OverlayShininess ("OverlayShininess", Range(0,1)) = 1.0
		_SpecColor ("SpecularColor",Color) = (1.0,1.0,1.0,1.0)
		_Specular ("Specular", Range(0,5)) = 1.0
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
        #pragma surface surf BlinnPhong
 
       
       
		sampler2D _Base;
		sampler2D _Overlay;
		uniform float _BaseShininess;
		uniform float _OverlayShininess;
		uniform float2 _Offset = (float2)(0.0);
		uniform float _Specular;

		struct Input {
			float2 uv_Base;
			float2 uv_Overlay;
			float3 worldPos;
		};

		float2 MirrorRepeat(float2 uv)
		{
			float2 x = abs(fmod(uv,2.0));
			if (x.x > 1.0)
				x.x = 2.0 - x.x;
			if (x.y > 1.0)
				x.y = 2.0 - x.y;
				
			return x;
		}
		
		
		void surf (Input IN, inout SurfaceOutput o) {
			half4 b = tex2D (_Base, MirrorRepeat(IN.worldPos.xz+_Offset));
			half4 overlay = tex2D (_Overlay, IN.worldPos.xz*0.1);
			
			o.Albedo = lerp(b.rgb,overlay.rgb,overlay.a);
			o.Alpha = b.a;
			
			
			o.Specular = _Specular;
			o.Gloss = lerp(_BaseShininess,_OverlayShininess,overlay.a);
			//o.Albedo = float3(o.Specular);
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
