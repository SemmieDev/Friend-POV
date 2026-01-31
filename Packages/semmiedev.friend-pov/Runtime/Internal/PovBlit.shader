Shader "Hidden/SemmieDev/POV Blit" {
    Properties {
        [MainTexture] _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader {
        Tags {
            "RenderType" = "Opaque"
        }

        Cull Off
        ZTest Always
        ZWrite Off
        Fog { Mode Off }

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include <UnityCG.cginc>

            struct appdata {
                float4 pos : POSITION;
            };

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;

            v2f vert(appdata v) {
                v2f o;

                if (_ProjectionParams.z > 0.01436286 && _ProjectionParams.z < 0.01436288) {
                    o.pos = v.pos;
                    o.uv = ComputeScreenPos(o.pos);
                } else {
                    o.pos = 0;
                    o.uv = 0;
                }

                return o;
            }

            float4 frag(v2f i) : SV_Target {
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
}