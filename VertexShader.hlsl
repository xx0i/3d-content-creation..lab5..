#pragma pack_matrix( row_major )  
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

cbuffer shaderVars
{
    matrix worldMatrix;
    matrix viewMatrix;
    matrix perspectiveMatrix;
};

OUTPUT main(shaderVars input : POSITION) : SV_POSITION 
{
    
    matrix result = mul(worldMatrix, viewMatrix);
    result = mul(result, perspectiveMatrix);
    float4 pos = mul(float4(input.pos, 1), result);
    
    OUTPUT output;
    output.pos = pos;
    output.norm = input.norm;
    output.texCoord = input.texCoords;
    output.tangents = input.tangents;
	return output;
}