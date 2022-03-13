//version 1.0; 2021.3.22  by YXF;//version 1.2; 2021.4.15  by YXF;//version 1.3; 2021.4.23  by YXF;//version 1.4; 2021.4.25  by YXF;//version 1.5; 2021.6.11  by YXF;//version 1.6; 2021.6.15  by YXF;//version 1.7; 2021.7.1  by YXF;//version 1.7; 2021.7.15  by YXF;
//version 1.8; 2021.7.20  by YXF;//version 1.9; 2021.9.25  by YXF;
//contact me :QQ 89270123

Shader "Effect/Effect_Lazy_Default " {
     Properties {
		[HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5	
		
		[Enum(UnityEngine.Rendering.BlendMode)] SrcBlend("SrcBlend", Float) = 5//SrcAlpha
		[Enum(UnityEngine.Rendering.BlendMode)] DstBlend("DstBlend", Float) = 10//One
		[Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull Mode", Float) = 0		
		[Enum(off,0,On,1)] _ZWrite ("ZWrite", float) = 0
		[Space(5)]
		[Toggle(IsCoustom)]IsCoustom("【IsCoustom】",int) = 0
		[Header(______BaseMap_____)]
		_BaseIsPolarBlend ("【BaseIsPolarBlend】", range (0,1) ) = 0
		_BasePolarRadius ("BasePolarRadius",Range(-1,1) )= 0.3
		_BaseTexRotation ("BaseTexRotation", Float ) = 0	
		[HDR] _BaseColor ("Base Color", Color) = (1,1,1,1)
		_AphaIntensity ("AphaIntensity", range (0,10) ) = 1
        _BaseMap ("Base Map", 2D) = "white" {}
		_RGBA("RGBA",Vector) = (0,0,0,0)
		_DeBlackBG ("DeBlackBG", range (0,1) ) = 0
        _BaseMapBrightness ("BaseMap Brightness", Range(0.001,30) ) = 1
        _BaseMapPower ("BaseMap Power", Range(0.001,30) ) = 1		
		_BaseMapPannerX ("BaseMapPannerX",Float) = 0 
		_BaseMapPannerY ("BaseMapPannerY",Float) = 0
		[Header(_____TurbulenceMap_____)]
		_TurbulenceIsPolarBlend ("【TurbulenceIsPolarBlend】", range (0,1) ) = 0
		_TurbulencePolarRadius ("TurbulencePolarRadius",Range(-1,1) )= 0.3
		_TurbulenceMulDis ("【TurbulenceMulDis】", range (-1,1) ) = 0
		_TurbulenceMulAllMask ("【TurbulenceMulAllMask】", range (-1,1) ) = 0
		_TurbulenceMulAllTex ("【TurbulenceMulAllTex】", range (-1,1) ) = 0
		_TurbulenceTexRotation ("TurbulenceTexRotation", Float ) = 0
        _TurbulenceTex ("Turbulence Tex", 2D) = "black" {}
        _TurbulenceTexPannerX ("Turbulence Tex Panner X", Float ) = 0
        _TurbulenceTexPannerY ("Turbulence Tex Panner Y", Float ) = 0
		_TurbulenceStrength ("TurbulenceStrength", Float ) = 0
		_TurbulenceX ("TurbulenceX", Float ) = 0
		_TurbulenceY ("TurbulenceY", Float ) = 0
		[Header(_____SMaskMap_____)]
		_SMaskIsPolarBlend ("【SMaskIsPolarBlend】", range (0,1) ) = 0		
		_SMaskPolarRadius ("SMaskPolarRadius",Range(-1,1) )= 0.3
		_SMaskIntensity ("SMaskIntensity", range (0,1) ) = 1
		_SMaskTexRotation ("SMaskTexRotation", Float ) = 0	
		_SMaskTex ("SMask Tex", 2D) = "white" {}
        _SMaskTexPannerX ("SMask Tex Panner X", Float ) = 0
        _SMaskTexPannerY ("SMask Tex Panner Y", Float ) = 0
		[Header(_____MaskMap_____)]
		_MaskIsPolarBlend ("【MaskIsPolarBlend】", range (0,1) ) = 0
		_MaskPolarRadius ("MaskPolarRadius",Range(-1,1) )= 0.3
		_MaskIntensity ("MaskIntensity", range (0,1) ) = 1
		_MaskTexRotation ("MaskTexRotation", Float ) = 0	
		_MaskTex ("Mask Tex", 2D) = "white" {}
        _MaskTexPannerX ("Mask Tex Panner X", Float ) = 0
        _MaskTexPannerY ("Mask Tex Panner Y", Float ) = 0		
		 [Header(_____DissolveMap_____)]
		_DissolvePolarBlend ("【DissolvePolarBlend】", range (0,1) ) = 0		
		_DissolvePolarRadius ("DissolvePolarRadius",Range(-1,1) )= 0.3
		_DissolveMultX ("【DissolveMultX】", range (-1,1) ) = 0
		_DissolveMultY ("【DissolveMultY】", range (-1,1) ) = 0		
		_DissolveTexRotation ("DissolveTexRotation", Float ) = 0	
		_DissolveTex ("Dissolve Tex", 2D) = "white" {}
        _DissolvePannerX ("Dissolve Tex Panner X", Float ) = 0
        _DissolvePannerY ("Dissolve Tex Panner Y", Float ) = 0
		_DisSoftness ("DisSoftness",range (0.1,2)) = 0.1
		_AnDissolve ("AnDissolve",range (-2.5,2)  ) = -2
		_DisRimWidth ("DisRimWidth" , Range(0,1) ) = 0
		[HDR] _DisRimColr ("DisRimColr",Color) = (1,1,1,1)
		[Header(_____OccMap_____)]
		_OcclusionPolarBlend ("【OcclusionPolarBlend】", range (0,1) ) = 0
		_OcclusionPolarRadius ("OcclusionPolarRadius",Range(-1,1) )= 0.3
		_OcclusionRotation ("OcclusionRotation", Float ) = 0	
		[HDR] _OcclusionColor ("OcclusionColor", Color) = (1,1,1,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
		_OcclusionBlend ("【OcclusionBlend】", range (0,1) ) = 0
		_OcclusionThrough ("【OcclusionThrough】", range (0,1) ) = 0		
		_OccDeBlackBG ("OccDeBlackBG", range (0,1) ) = 0
        _OcclusionBrightness ("OcclusionBrightness", Range(0.001,30) ) = 1
        _OcclusionPower ("OcclusionPower", Range(0.001,30) ) = 1		
		_OcclusionPannerX ("OcclusionPannerX",Float) = 0 
		_OcclusionPannerY ("OcclusionPannerY",Float) = 0  					
		[Header(_____PointMove_____)]
		[Toggle(UseUV2)]UseUV2("【UseUV2】",int) = 0
		_PointMove ("【PointMove】",vector ) =(0,0,0,0)
		_PointMoveIsPolarBlend ("【PointMoveIsPolarBlend】", range (0,1) ) = 0
		_PointMovePolarRadius ("PointMovePolarRadius",Range(-1,1) )= 0.3	
		_PointMoveRotation ("PointMoveRotation", Float ) = 0
		_PointMoveTex ("PointMoveTex", 2D) = "white" {}
		_PointMoveX ("PointMovePannerX",Float) = 0 
		_PointMoveY ("PointMovePannerY",Float) = 0
		_PointMoveUnNormal ("PointMoveUnNormal", range(0,1) ) = 0
		_PointMoveMulSMask ("PointMoveMulSMask", range(0,1) ) = 0		   						
		[Header(_____NormalMap_____)]
		_NormalPolarBlend ("【NormalPolarBlend】", range (0,1) ) = 0
		_NormalPolarRadius ("NormalPolarRadius",Range(-1,1) )= 0.3
		_NormalRotation ("NormalRotation", Float ) = 0	
		_NormalTex ("【Normal】", 2D) = "white" {}
		_NormalPannerX ("NormalPannerX",Float) = 0 
		_NormalPannerY ("NormalPannerY",Float) = 0  
		_NormalScale ("NormalScale", Float ) = 0
		_NormalZ ("NormalZ", range (0,10) ) = 1 //提高暗部亮度	
		[Header(_____Swirl_____)]
		_SwirlAngle ("SwirlAngle",Float) = 0 
		_SwirlRemoveMask ("SwirlRemoveMask", range(0,1) ) = 0
		_SwirlRemovePointmove ("SwirlRemovePointmove", range(0,1) ) = 0	
		[Header(_____IsLighting_____)]	
		_IsLightingBlend ("【IsLightingBlend】", range (0,1) ) = 0	
		[HDR] _LightColor ("LightColor",Color) = (1,1,1,1)
		_LightIntensity ("LightIntensity", range (0,10) ) = 0.1
		_LightPow ("LightPower", range (0.01,10) ) = 1
		 [Header(_____Fresnel_____)]	
		_FresnelBlend ("【FresnelBlend】", range (0,1) ) = 0
		[HDR] _FColor ("FColor",Color) = (1,1,1,1)
		[HDR] _FinColor ("FinColor",Color) = (1,1,1,1)
		_FScale ("FScale",Float ) = 3
		_FinScale ("FinScale",Float ) = 15
		 [Header(_____Fade_____)]	
	    _Fade ("FadeSize(RimSize)", range(0,10) ) = 0
	    _FadePower ("Fade(Rim)Power", range(0.1,10) ) = 1
		_IsRimLightBlend ("【IsRimLightBlend】", range (0,1) ) = 0
		[HDR] _RimColor("RimColor",Color)=(1,1,1,1)
		 _MeshFade ("MeshFade", range(0,10) ) = 0
		 _MeshFadePower ("MeshFadePower", range(0.1,10) ) = 1		
		[Header(_____DoubleFace_____)]	
		_DoubleFaceBlend ("【DoubleFaceBlend】", range (0,1) ) = 0
		[HDR] _FaceInColor ("FaceInColor",Color) = (1,1,1,1)
		[HDR] _FaceOurColor ("FaceOurColor",Color) = (1,1,1,1)
		[Header(_____Refract_____)]	
		_RefractBlend ("【RefractBlend】", range (0,1) ) = 0
		_RefractStrength ("RefractStrength", range (-5,5) ) = 0.2
		_RefractAphaStrength ("RefractAphaStrength", range (0,5) ) = 5		
		[Header(_____BlackWhite_____)]	
		_BlackWhiteBlend ("【BlackWhiteBlend】", range (0,1) ) = 0
		_BlackWhitePower ("BlackWhitePower", range(0.1,30) ) = 1	
		_BlackWhiteAphaStrength ("BlackWhiteAphaStrength", range (0,5) ) = 5	
		[Header(_____SquenceMove_____)]	
		_SquenceMoveBlend ("【SquenceMoveBlend】", range (0,1) ) = 0
		_SquenceRow ("SquenceRow", float ) = 1	
		_SquenceColumn ("SquenceColumn",float ) = 1
		_SquenceSpeed ("Speed",float ) = 1		
		[Toggle(IsPointLight)]IsPointLight("【IsPointLight】",int) = 0	
		//[Space(10)]
		//Stencile	
		//[Header(Stencil)]
  //      [Space(5)]
  //      [IntRange] _Stencil         ("Stencil Reference", Range (0, 255)) = 0
  //      [IntRange] _ReadMask        ("     Read Mask", Range (0, 255)) = 255
  //      [IntRange] _WriteMask       ("     Write Mask", Range (0, 255)) = 255
  //      [Enum(UnityEngine.Rendering.StencilOp)]
  //      _StencilFail                ("Stencil Fail Op", Int) = 0           // 0 = keep
  //      [Enum(UnityEngine.Rendering.StencilOp)] 
  //      _StencilZFail               ("Stencil ZFail Op", Int) = 0          // 0 = keep	
		[Header(_____Stencil_____)]	
		[IntRange] _StencilID         ("StencilID", Range (0, 4)) = 4    
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp  ("Stencil Comparison", Int) = 8		
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Int) = 0      // 0 = keep, 2 = replace
		[Enum(UnityEngine.Rendering.CompareFunction)]  _ZTest ("ZTest ",float) = 4	
		//[Enum(UnityEngine.Rendering.StencilOp)] 
		//_StencilZFail               ("Stencil ZFail Op", Int) = 0          // 0 = keep
		[Header(_____ColorMask_____)]	
		_ColorMask("ColorMask", Range (0, 14)) = 14
	
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
			 }
			 //Stencil {
    //            Ref   [_Stencil]
    //            ReadMask [_ReadMask]
    //            WriteMask [_WriteMask]
    //            Fail  [_StencilFail]
    //            ZFail [_StencilZFail]
    //        }
		Stencil {
                Ref   [_StencilID]
                Comp  [_StencilComp]//Gequal
                Pass  [_StencilOp]//replace
            }
		GrabPass{
			//"_GrabTexture"//如果想使用自定义名称则需要把折射shader分开单独来，因为那样只会抓取一次屏幕，相对来说比较节省性能
			}		
        Pass {			
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
			Blend[SrcBlend][DstBlend]
            Cull [_Cull]
            ZWrite [_ZWrite]
			ZTest [_ZTest]
			ColorMask [_ColorMask]
			
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
			#include "UnityCG.cginc"
			#include "lighting.cginc"
			#pragma shader_feature __ IsCoustom
			#pragma shader_feature __ UseUV2
			#pragma shader_feature __ IsPointLight
            CBUFFER_START(UnityPerMaterial)	
				float _SwirlAngle;
				float _SwirlRemoveMask;
				float _SwirlRemovePointmove;
					
				float _BaseIsPolarBlend;			
				float _BasePolarRadius;
				float _BaseTexRotation;
				float4 _BaseColor;
				float _AphaIntensity;
				float4 _BaseMap_ST;			
				float4 _RGBA;		
	            float _BaseMapBrightness;
				float _BaseMapPower;
				float _BaseMapPannerX;
				float _BaseMapPannerY;
				float _DeBlackBG;

				float _OcclusionPolarBlend;
				float _OcclusionPolarRadius;
				float _OcclusionRotation;
				float4 _OcclusionColor;
				float4 _Occlusion_ST;
				float _OccDeBlackBG;
				float _OcclusionBlend;
				float _OcclusionThrough;
				float _OcclusionBrightness;
				float _OcclusionPower;
				float _OcclusionPannerX;
				float _OcclusionPannerY;

				float _TurbulenceIsPolarBlend;
				float _TurbulencePolarRadius;
				float _TurbulenceTexRotation;
				float4 _TurbulenceTex_ST;
            	float _TurbulenceTexPannerX;
            	float _TurbulenceTexPannerY;
				float _TurbulenceStrength;
				float _TurbulenceMulDis;
				float _TurbulenceMulAllMask;
				float _TurbulenceMulAllTex;
				float _TurbulenceX;
				float _TurbulenceY;

				float _SMaskIsPolarBlend;
				float _SMaskIntensity;
				float _SMaskPolarRadius;
				float _SMaskTexRotation;
				float4 _SMaskTex_ST;
	            float _SMaskTexPannerX;
	            float _SMaskTexPannerY;

				float _MaskIsPolarBlend;
				float _MaskIntensity;
				float _MaskPolarRadius;
				float _MaskTexRotation;
				float4 _MaskTex_ST;
	            float _MaskTexPannerX;
	            float _MaskTexPannerY;

				float _DissolvePolarBlend;
				float _DissolveMultX;
				float _DissolveMultY;
				float _DissolvePolarRadius;
				float _DissolveTexRotation;
				float4 _DissolveTex_ST;
	            float _DissolvePannerX;
	            float _DissolvePannerY;
				float _DisSoftness;
				float _AnDissolve;
				float _DisRimWidth;
				float4 _DisRimColr;

				float _PointMoveIsPolarBlend;
				float _PointMovePolarRadius;
				float _PointMoveRotation;
				float4 _PointMoveTex_ST;
				float _PointMoveX;
				float _PointMoveY;
				float4 _PointMove;
				float _PointMoveUnNormal;
				float _PointMoveMulSMask;

				float _DoubleFaceBlend;

				float _FresnelBlend;
				float _FScale;
				float _FinScale;
				float4 _FinColor;
				float4 _FColor;
				float4 _FaceInColor;
				float4 _FaceOurColor;
				float _Fade;
				float _MeshFade;
				float _MeshFadePower;
				float4 _RimColor;
				float _FadePower;

				float _NormalPolarBlend;
				float _NormalPolarRadius;
				float _NormalRotation;
				float4 _NormalTex_ST;
				float _NormalPannerX;
	            float _NormalPannerY;
				float _NormalScale;
				float _NormalZ;
				float  _IsLightingBlend;
				float  _IsRimLightBlend;
				float4 _LightColor;
				float _LightIntensity;
				float _LightPow;

				float _RefractStrength;
				float _RefractAphaStrength;
				float _RefractBlend;

				float _BlackWhiteBlend;
				float _BlackWhitePower;
				float _BlackWhiteAphaStrength;

				float _SquenceMoveBlend;
				float _SquenceRow;
				float _SquenceColumn;
				float _SquenceSpeed;
				
            CBUFFER_END
			sampler2D _PointMoveTex;
			sampler2D _MaskTex;
			sampler2D _SMaskTex;
			sampler2D _NormalTex;
			sampler2D _TurbulenceTex;
			sampler2D _BaseMap;
			sampler2D _Occlusion;
			sampler2D _DissolveTex;
			sampler2D _CameraDepthTexture;
			sampler2D _GrabTexture;

            struct VertexInput {
                float4 vertex : POSITION;
                float4 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 tangent : TANGENT;
                float4 vertexColor : COLOR;
				float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
				float4 custom2 : TEXCOORD2;
				float4 tangent : TEXCOORD3;
                float4 vertexColor : COLOR;
				float3 normal : TEXCOORD8;
				float3 posWS : TEXCOORD7;
				float4 positionScreen : TEXCOORD5;
            };
			float remap (float S,float Begin,float End,float TBegin,float TEnd)//区间映射
			{
				return (S - Begin )/(End - Begin)*(TEnd - TBegin) + TBegin;
			};
			float2 Swirl(float2 uv,float Intensity)//Swirl
			{
				uv -= float2(0.5,0.5);
				float dis = length(uv);
				float percent = 1 - dis;
				float theta = percent * percent * Intensity * 8;
				float s = sin(theta);
				float c = cos(theta);
				uv = float2(uv.x * c - uv.y * s, uv.x * s + uv.y * c);
				uv +=float2(0.5,0.5);
				return uv;
			};
			float2 polaruv (float2 uv, float radius)//Polar
			{
				float2 Puv;
				float PolarRadius ;
				PolarRadius = radius;
				Puv = uv;
				Puv -= float2 (0.5,0.5);
				Puv = float2 (atan2(Puv.y,Puv.x)/3.141593*0.5+0.5,length(Puv)+PolarRadius);
				return Puv;
			};
			float2 SequenceMove(float2 uv )//Sequence move
			{
				float2 SUV ;				
				float time = floor(_Time.y*_SquenceSpeed);
				float row = floor(time/_SquenceColumn);
				float column = time - row *_SquenceRow;
				SUV= uv + float2(column,-row);
				SUV.x/=_SquenceColumn;
				SUV.y/=_SquenceRow;
				return SUV;
			}
			float2 rotation(float2 uv, float angle) //Rotation uv
			{
				float2 Ruv;
				float Rangle;
				Rangle = radians(angle);//角度转弧度
				Ruv = uv;
				Ruv -= float2(0.5, 0.5);
				Ruv = float2(Ruv.x * cos(Rangle) - Ruv.y * sin(Rangle), Ruv.x * sin(Rangle) + Ruv.y * cos(Rangle));
				Ruv += float2(0.5, 0.5);
				return Ruv;
			};

            VertexOutput vert (VertexInput v) {
				VertexOutput o = (VertexOutput)0;	
				o.uv0 = v.texcoord0;		
				o.uv1 = v.texcoord1;
				o.custom2 =  v.texcoord2;

				//SwirlUV
				float2 SwirlPuv =  lerp(Swirl(o.uv0.xy,_SwirlAngle),o.uv0.xy,_SwirlRemovePointmove);
				#if defined(IsCoustom)
					 SwirlPuv =  lerp(Swirl(o.uv0.xy,_SwirlAngle+o.custom2.b),o.uv0.xy,_SwirlRemovePointmove);
				# endif 		

				//SMASK Pointmove
				float2 smaskuv = lerp(SwirlPuv,polaruv (SwirlPuv,_SMaskPolarRadius ),_SMaskIsPolarBlend);
				float2 _SMaksUVCruve = 0 ;
				#if defined(IsCoustom)
					 _SMaksUVCruve = float2(o.custom2.r  , o.custom2.g )  ;
				# endif 				       				      											
				#if defined(UseUV2)
				 smaskuv = lerp(o.uv0.zw,polaruv (o.uv0.zw,_SMaskPolarRadius ),_SMaskIsPolarBlend);			       				      
				#endif 
				float2 _SMakUVSelfMove = float2(_SMaskTexPannerX , _SMaskTexPannerY) * _Time.g ;
				float2 _SMakUV =  (smaskuv + float2(_SMaksUVCruve + _SMakUVSelfMove));
					  _SMakUV = rotation(_SMakUV,_SMaskTexRotation);	
				float4 _SMask_var = tex2Dlod(_SMaskTex,float4( TRANSFORM_TEX(_SMakUV,_SMaskTex) ,0,0));
				float _SMaskOut = lerp(0,_SMask_var.r * _SMask_var.a,_PointMoveMulSMask) ;		
								
				//Point move 	
				float CustomCurve = 1 ;	
				#if defined(IsCoustom)
							CustomCurve =  CustomCurve = 1+ o.custom2.w  ;							
				# endif		
				float2	SwirlPuvP =  lerp(SwirlPuv,polaruv (SwirlPuv,_PointMovePolarRadius ),_PointMoveIsPolarBlend);			
				float4 move = 	float4 ((rotation(SwirlPuvP ,_PointMoveRotation) + float2(_Time.y * _PointMoveX, _Time.y * _PointMoveY)),0,0);
				#if defined(UseUV2)
				       move = 	float4 ((rotation(o.uv0.zw ,_PointMoveRotation) + float2(_Time.y * _PointMoveX, _Time.y * _PointMoveY)),0,0);
				#endif 				
				float4 turCol = tex2Dlod(_PointMoveTex, float4(TRANSFORM_TEX(move,_PointMoveTex) ,0,0))  ;
				float turColOut = turCol.r*turCol.a;	

				//float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				//float3 ObjectPosition = mul(unity_ObjectToWorld, float4(0.0, 0.0, 0.0, 1.0)).xyz;
				//worldPos -= ObjectPosition;
				//worldPos += float3((turColOut+_SMaskOut) * _PointMove.x,(turColOut+_SMaskOut) * _PointMove.y,(turColOut+_SMaskOut) * _PointMove.z)*lerp(v.normal,1,_PointMoveUnNormal)* (_PointMove.w + CustomCurve) ;						
				//worldPos += ObjectPosition;			
    //            o.vertexColor = v.vertexColor;
				//o.posWS =  mul(unity_ObjectToWorld, v.vertex.xyz);
    //            o.pos = UnityObjectToClipPos( worldPos);																	
				v.vertex.xyz += float3((turColOut+_SMaskOut) * _PointMove.x,(turColOut+_SMaskOut) * _PointMove.y,(turColOut+_SMaskOut) * _PointMove.z)*lerp(v.normal,1,_PointMoveUnNormal)* (_PointMove.w + CustomCurve) ;						
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex.xyz);
				o.posWS =  mul(unity_ObjectToWorld, v.vertex.xyz);
				o.normal = v.normal;
				o.tangent = v.tangent;
				//Fade								
				o.positionScreen = ComputeScreenPos(o.pos);//z分量为裁剪空间的z值，范围[-Near,Far]
				COMPUTE_EYEDEPTH(o.positionScreen.z);//COMPUTE_EYEDEPTH函数，将z分量范围[-Near,Far]转换为[Near,Far]
				
                return o;
            }


            float4 frag(VertexOutput i , float facing : VFACE) : COLOR {	
				//SwirlUV
				float2 UnDeformUV = i.uv0.xy;
				float2 SwirlMaskUV = lerp(Swirl(i.uv0.xy,_SwirlAngle),i.uv0.xy,_SwirlRemoveMask);
				i.uv0.xy =  Swirl(i.uv0.xy,_SwirlAngle);
				#if defined(IsCoustom)
					 SwirlMaskUV = lerp(Swirl(UnDeformUV,_SwirlAngle+i.custom2.b),UnDeformUV,_SwirlRemoveMask);
					 i.uv0.xy =  Swirl(UnDeformUV,_SwirlAngle+i.custom2.b);
				# endif 	
				//SquenceUV
				i.uv0.xy = lerp(i.uv0.xy, SequenceMove(i.uv0.xy),_SquenceMoveBlend);
				//Tub11erlence
				float2 tuv =  lerp(i.uv0.xy,polaruv (i.uv0.xy,_TurbulencePolarRadius ),_TurbulenceIsPolarBlend);	
				float2 _TUVCruve = 0 ;
				float2 _TurbulenceMove = float2(_TurbulenceTexPannerX , _TurbulenceTexPannerY) * _Time.g ;
				float2 _TurbulenceUV = (tuv+_TurbulenceMove );
					 _TurbulenceUV = rotation(_TurbulenceUV,_TurbulenceTexRotation);			
				#if defined(IsCoustom)
					 _TurbulenceUV = (tuv + float2(_TUVCruve + _TurbulenceMove));
					 _TurbulenceUV = rotation(_TurbulenceUV,_TurbulenceTexRotation);	
				# endif 
				float4 _TurbulenceTex_var = tex2D(_TurbulenceTex,  TRANSFORM_TEX(_TurbulenceUV, _TurbulenceTex));
				float _AfTuv = _TurbulenceTex_var.r *_TurbulenceTex_var.a *_TurbulenceStrength;
				float _AfTuv1 = _TurbulenceTex_var.r* _TurbulenceTex_var.a  * (lerp(0,i.uv1.b,_TurbulenceStrength)+_TurbulenceStrength);
				float _AllTurbulence = lerp(0,_AfTuv1,_TurbulenceMulAllTex); 
				float tuvoffsetx = _TurbulenceX*_TurbulenceTex_var.r *_TurbulenceTex_var.a*(i.uv1.b+1) ;
				float tuvoffsety = _TurbulenceY*_TurbulenceTex_var.r *_TurbulenceTex_var.a*(i.uv1.b+1) ;
				float2 Tmask = float2 (tuvoffsetx*(_TurbulenceMulAllMask + _TurbulenceMulAllTex),tuvoffsety*(_TurbulenceMulAllMask + _TurbulenceMulAllTex));
				float2 Tdis = float2 (tuvoffsetx*(_TurbulenceMulDis + _TurbulenceMulAllTex),tuvoffsety*(_TurbulenceMulDis + _TurbulenceMulAllTex));
				float2 TA = float2 (tuvoffsetx*_TurbulenceMulAllTex,tuvoffsety*_TurbulenceMulAllTex);
				float2 TB = float2 (tuvoffsetx,tuvoffsety);
				
				//SMASK
				float2 smaskuv = lerp(i.uv0.xy,polaruv (i.uv0.xy,_SMaskPolarRadius ),_SMaskIsPolarBlend);
				float2 _SMaksUVCruve = 0 ;
				#if defined(IsCoustom)
					 _SMaksUVCruve = float2(i.custom2.r  , i.custom2.g )   ;
				# endif 				       				      
				float2 _SMakUVSelfMove = float2(_SMaskTexPannerX , _SMaskTexPannerY) * _Time.g ;
				float2 _SMakUV =   lerp(0,_AfTuv1,_TurbulenceMulAllMask) + _AllTurbulence + (smaskuv + Tmask+ float2(_SMaksUVCruve + _SMakUVSelfMove));			
					  _SMakUV = rotation(_SMakUV,_SMaskTexRotation);				            
				float4 _SMask_var = tex2D(_SMaskTex,  TRANSFORM_TEX(_SMakUV, _SMaskTex));
				float _SMaskOut = _SMask_var.r * _SMask_var.a ;	
					  _SMaskOut=lerp(1,_SMaskOut, _SMaskIntensity);
				
				//MASK
				float2 maskuv = lerp(SwirlMaskUV,polaruv (SwirlMaskUV,_MaskPolarRadius ),_MaskIsPolarBlend);
				float2 _MaksUV = lerp(0,_AfTuv1,_TurbulenceMulAllMask) + _AllTurbulence +(maskuv+ Tmask+(float2(_MaskTexPannerX,_MaskTexPannerY)*_Time.g) );
						_MaksUV = rotation(_MaksUV,_MaskTexRotation);			
				float4 _MaskTex_var = tex2D(_MaskTex, TRANSFORM_TEX(_MaksUV, _MaskTex));	
				float _MaskOut = _MaskTex_var.r * _MaskTex_var.a ;
					  _MaskOut=lerp(1,_MaskOut, _MaskIntensity);				
				
				//DoubleFace
				float DoubleFace = (facing >= 0 ?  1 : 0);
				float3 FaceColor =lerp( float3(1,1,1),( (DoubleFace * _FaceOurColor + (1 - DoubleFace) *_FaceInColor ).rgb),_DoubleFaceBlend) ;

				//Fresnel
				float3  N = normalize( UnityObjectToWorldNormal(i.normal));
				float3  V = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
				float4  F = pow(( 1 - saturate( dot( N , V))),_FScale) * _FColor ;		
				float4  Fin = saturate(pow((  saturate( dot( N , V))),_FinScale)) * _FinColor ;		
						F = F+Fin;	
												
				//MeshFade
				float MeshF =saturate(lerp(1, pow(saturate(dot( N,V )),_MeshFadePower),_MeshFade));
									
				//Lighting				
				float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);						
				float3 Lightdiff = saturate(dot(lightDirection,N));	
								
				//Normal
				float2 normaluv = lerp(i.uv0.xy,polaruv (i.uv0.xy,_NormalPolarRadius ),_NormalPolarBlend);		
				float3 T = normalize(mul(unity_ObjectToWorld,i.tangent.xyz));
				float3 BT = normalize(cross(N,T)*i.tangent.w);
				float3x3 RotaTangent = float3x3 (T,BT,N) ;	//转切线空间矩阵				
				float3 Tlight = mul(RotaTangent,lightDirection);
				float2 _bumpUV =_AllTurbulence + (normaluv+TA+(float2(_NormalPannerX,_NormalPannerY)*_Time.g) );
					   _bumpUV = rotation(_bumpUV,_NormalRotation);	
				float3 bump = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(_bumpUV, _NormalTex)));
				bump.xy *=  _NormalScale;	
				bump.z = sqrt(1-saturate(dot(bump.xy,bump.xy)));
				float3 lightN = saturate(dot(Tlight,bump));
																
				//Base
				float2 baseuv =  lerp(i.uv0.xy,polaruv (i.uv0.xy,_BasePolarRadius ),_BaseIsPolarBlend)	;						
				float2 _BaseUVCruve = 0 ;
				#if defined(IsCoustom)
					 _BaseUVCruve = float2(i.uv1.r  , i.uv1.g )   ;
				# endif 				       				      
				float2 _BaseUVSelfMove = float2(_BaseMapPannerX , _BaseMapPannerY) * _Time.g ;
				float2 _BaseUV = (_AfTuv + (baseuv+TB + float2(_BaseUVCruve + _BaseUVSelfMove)));
					  _BaseUV = rotation(_BaseUV,_BaseTexRotation);				
				#if defined(IsCoustom)
					 _BaseUV = (_AfTuv1  + (baseuv+TB + float2(_BaseUVCruve + _BaseUVSelfMove)));
					 _BaseUV = rotation(_BaseUV,_BaseTexRotation);
				# endif           
				float4 _BaseMap_var = tex2D(_BaseMap,  TRANSFORM_TEX(_BaseUV, _BaseMap));
				float4	_BaseMap_vara =  _BaseMap_var.r*_RGBA.r + _BaseMap_var.g*_RGBA.g  + _BaseMap_var.b*_RGBA.b ;
					_BaseMap_var = lerp(_BaseMap_var,_BaseMap_vara,_RGBA.a)	;
				//Occlusion  
				float2 occuv = lerp(i.uv0.xy,polaruv (i.uv0.xy,_OcclusionPolarRadius ),_OcclusionPolarBlend);			      
				float2 _OcclusionUVSelfMove = float2(_OcclusionPannerX , _OcclusionPannerY) * _Time.g ;
				float2 _OcclusionUV = (_AllTurbulence + (occuv+TA + _OcclusionUVSelfMove));
					   _OcclusionUV = rotation(_OcclusionUV,_OcclusionRotation);
                float4 _Occlusion_var = tex2D(_Occlusion, TRANSFORM_TEX(_OcclusionUV, _Occlusion));
					   _Occlusion_var *=_OcclusionColor;
	
				//Disslove
				float2 dissolveUV1 = lerp(i.uv0.xy,polaruv (i.uv0.xy,_DissolvePolarRadius ),_DissolvePolarBlend);
				float2 dissolveUV2 = lerp(i.uv0.zw,polaruv (i.uv0.zw,_DissolvePolarRadius ),_DissolvePolarBlend);
				float2 _DissolveUV = lerp(0,_AfTuv1,_TurbulenceMulDis)+_AllTurbulence + (dissolveUV1+Tdis+float2(_DissolvePannerX * _Time.g ,_DissolvePannerY * _Time.g));
				#if defined(UseUV2)
				 _DissolveUV = lerp(0,_AfTuv1,_TurbulenceMulDis)+_AllTurbulence + (dissolveUV2+Tdis +float2(_DissolvePannerX * _Time.g ,_DissolvePannerY * _Time.g));
				#endif 					
					 _DissolveUV = rotation(_DissolveUV,_DissolveTexRotation);				
				float4 _DissolveTex_var = tex2D(_DissolveTex,  TRANSFORM_TEX(_DissolveUV, _DissolveTex));		
				float uvdisX = lerp(0,i.uv0.x*ceil(_DissolveMultX),abs(_DissolveMultX));//UVX定向溶解	
				float uvdisY = lerp(0,i.uv0.y*ceil(_DissolveMultY),abs(_DissolveMultY));//UVY定向溶解				
				float _DissolveOut = pow (( saturate (_DissolveTex_var.r*_DissolveTex_var.a - uvdisX - uvdisY -  _AnDissolve ) ), _DisSoftness ) ;	
				#if defined(IsCoustom)
					 _DissolveOut = pow (( saturate (_DissolveTex_var.r*_DissolveTex_var.a  - uvdisX - uvdisY - saturate(i.uv1.a)*2 -  _AnDissolve ) ), _DisSoftness ) ;	
				# endif  
								
				//dissloverim					
				clip(_DissolveOut - _DisRimWidth);
				float lightrim  = ( _DissolveOut  - _DisRimWidth < _DisRimWidth ? 1 : 0 );
				float4 lightrimcolor = float4(1,1,1,lightrim)*_DisRimColr;
				
				//pointlight
				#if defined(IsPointLight)									
				float3 pL = Shade4PointLights(unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
					unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
					unity_4LightAtten0,
					i.posWS, N);
				# endif  
				//Out
				float _AphaOut = 1;
				float3 _ColorOut = float3(1,1,1);	
				float3 _ColorOutA = _BaseColor.rgb * (pow((_BaseMapBrightness * _BaseMap_var.rgb), _BaseMapPower) * i.vertexColor.rgb)* FaceColor.rgb + F.rgb  ;
				float3 _ColorOutAO =  (pow((_OcclusionBrightness * _Occlusion_var.rgb), _OcclusionPower) * i.vertexColor.rgb)* FaceColor.rgb + F.rgb ;
					  _ColorOutA = lerp(lerp(_ColorOutA,_ColorOutA*_Occlusion_var.r,_OcclusionThrough),_ColorOutAO,_OcclusionBlend);

				float3 _ColorOutB =_BaseColor.rgb * (pow((_BaseMapBrightness * _BaseMap_var.rgb), _BaseMapPower) * i.vertexColor.rgb) * FaceColor.rgb;
				float3 _ColorOutBO =   (pow((_OcclusionBrightness * _Occlusion_var.rgb),_OcclusionPower) * i.vertexColor.rgb) * FaceColor.rgb;
					   _ColorOutB = lerp(lerp(_ColorOutB,_ColorOutB*_Occlusion_var.r,_OcclusionThrough),_ColorOutBO,_OcclusionBlend);

					_ColorOut = lerp(_ColorOutB,_ColorOutA,_FresnelBlend);																	                 				
				    _ColorOut *= lerp((saturate( dot(_ColorOut,bump))+_NormalZ),(saturate( dot(_ColorOut,lightN))+_NormalZ+pow( Lightdiff ,_LightPow)*_LightIntensity*_LightColor.rgb),_IsLightingBlend);			
				_AphaOut = lerp( _BaseColor.a  * _BaseMap_var.a * _SMaskOut * _MaskOut  * _DissolveOut * i.vertexColor.a * MeshF,_BaseColor.a * _BaseMap_var.r * _BaseMap_var.a * _SMaskOut * _MaskOut  * _DissolveOut * i.vertexColor.a * MeshF,_DeBlackBG);
				float _AphaOutO = lerp( _Occlusion_var.a * _SMaskOut * _MaskOut  * _DissolveOut * i.vertexColor.a * MeshF, _Occlusion_var.r * _Occlusion_var.a * _SMaskOut * _MaskOut  * _DissolveOut * i.vertexColor.a * MeshF,_OccDeBlackBG);
				 _AphaOut = saturate( lerp (_AphaOut, _AphaOutO, _OcclusionBlend)*_AphaIntensity)	;	
				_ColorOut = lerp (_ColorOut,lightrimcolor.rgb,step(_DissolveOut,lightrim) );//增加亮边颜色
				float4 col = float4(_ColorOut,_AphaOut);
				#if defined(IsPointLight)
					 col = float4(_ColorOut+pL,_AphaOut);
				# endif 

				//Fade																											
				float screenZ = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE_PROJ(_CameraDepthTexture,i.positionScreen));//负责把深度纹理的采样转到视角空间下的深度值。				
				float diff = saturate(abs(screenZ - i.positionScreen.z));
				float4 colend = 1 - saturate( lerp (_Fade ,0,diff));				
				colend =saturate(pow(colend,_FadePower));
				col.a = col.a*colend.a;
				float4 rim =lerp( 0,_AphaOut *(pow((1-colend),_FadePower))*_RimColor,_IsRimLightBlend);

				//Refract
				float2 ScreenUV = (i.pos.xy /  _ScreenParams.xy) + col.a *_RefractStrength ;
				#if !UNITY_UV_STARTS_AT_TOP
                	ScreenUV.y =  1 - ScreenUV.y;
				#endif
				float4 refracttex = tex2D(_GrabTexture,ScreenUV);
				refracttex.a = saturate( col.a * _RefractAphaStrength);
				float4 finalout = lerp((col+rim),refracttex,_RefractBlend);//混合折射

				//BlackWhite
				float2 BlackWhiteUV = lerp((i.pos.xy /  _ScreenParams.xy),ScreenUV,_RefractBlend);
				float4 blackwhite = tex2D(_GrabTexture,BlackWhiteUV);
				float grey = dot(blackwhite.rgb, fixed3(0.22, 0.707, 0.071));
				blackwhite.rgb = saturate( 1 - pow( float3(grey, grey, grey),_BlackWhitePower));  
				blackwhite.a = saturate( col.a * _BlackWhiteAphaStrength);								
				finalout = lerp(finalout,blackwhite,_BlackWhiteBlend);

				return finalout;

            }
            ENDHLSL
        }
				
    }

}

