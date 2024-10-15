// an ultra simple hlsl fragment shader
struct OUTPUT
{
    float4 pos : SV_POSITION;
    float3 norm : NORMAL;
    float2 texCoord : TEXCOORD;
    float4 tangents : TANGENT;
};

float4 main() : SV_TARGET
{
	return float4(0.62f, 0.50f, 0.50f, 0); //part a1
}