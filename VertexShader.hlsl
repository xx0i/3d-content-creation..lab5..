// an ultra simple hlsl vertex shader
struct shaderVars //part b4
{
    float3 pos : POSITION;
    float3 norm : NORMAL;
    float2 texCoords : TEXCOORD;
    float4 tangents : TANGENT;
};

struct OUTPUT
{
    float4 pos : SV_POSITION;
    float3 norm : NORMAL;
    float2 texCoord : TEXCOORD;
    float4 tangents : TANGENT;
};

OUTPUT main(shaderVars input : POSITION) : SV_POSITION 
{
    OUTPUT output;
    output.pos = float4(input.pos, 1);
    output.norm = input.norm;
    output.texCoord = input.texCoords;
    output.tangents = input.tangents;
	return output;
}