Shader "Effect/Ground"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Glossiness("Smoothness", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
        _Normal("Normal",2D) = "NormalMap"{}


        [Header(_____Stencil_____)]

        [IntRange] _StencilID("StencilID", Range(0, 4)) = 4          //模板值
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp("Stencil Comparison", Int) = 8       //对比方法
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilOp("Stencil Operation", Int) = 0      //对比通过后操作 0 = keep, 2 = replace
        [Enum(UnityEngine.Rendering.CompareFunction)]  _ZTest("ZTest ",float) = 4             //深度测试值
        [Enum(UnityEngine.Rendering.BlendMode)] SrcBlend("SrcBlend", Float) = 5               //SrcAlpha
        [Enum(UnityEngine.Rendering.BlendMode)] DstBlend("DstBlend", Float) = 10              //One
    
    	[Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull Mode", Float) = 0		
    	[Enum(Off,0,On,1)] _ZWrite ("ZWrite", float) = 0

    }
    
    SubShader
    {

        Tags
        {
            //忽略投影
            "IgnoreProjector" = "True"
            //渲染队列 透明
            "Queue" = "Transparent"
            //渲染类型 透明
            "RenderType" = "Transparent"
        }

         //透明混合
        Blend[SrcBlend][DstBlend]
        ZWrite [_ZWrite]
        Cull [_Cull]

        LOD 200

        Stencil 
        {
            //模板值
            Ref[_StencilID]
            //比较方法 Gequal表示大于等于模板缓冲区中的值才通过
            Comp[_StencilComp]//Gequal
            //通过后的操作 replace更新模板缓冲区的值
            Pass[_StencilOp]//replace
        }

        CGPROGRAM
        // 用于指明表面函数和其中的表面函数和光照函数 最后是可选参数
        #pragma surface surf Standard alpha

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _NormalMap;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Normal=UnpackNormal(tex2D(_NormalMap,IN.uv_NormalMap));
            o.Alpha = c.a * _Color.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
