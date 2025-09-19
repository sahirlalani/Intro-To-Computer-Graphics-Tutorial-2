Shader "Custom/Shader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _SecondTex ("Second Texture", 2D) = "white" {}
        _BlendFactor ("Blend Factor", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM

            sampler2D _MainTex;
            sampler2D _SecondTex;
            float _BlendFactor;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col1 = tex2D(_MainTex, i.uv);
                fixed4 col2 = tex2D(_SecondTex, i.uv);

                // Blend the two textures
                fixed4 finalColor = lerp(col1, col2, _BlendFactor);
                return finalColor;
            }
        }
    }
            ENDCG
}
