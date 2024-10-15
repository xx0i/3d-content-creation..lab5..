#pragma pack_matrix( row_major )  
// an ultra simple hlsl vertex shader
struct shaderVars //part b4
{
    float3 pos : POSITION;
    float3 norm : NORMAL;
    float2 texCoords : TEXCOORD;
    float4 tangents : TANGENT;
};

struct OUTPUT1
{
    float4 pos : SV_POSITION;
    float3 norm : NORMAL;
    float2 texCoord : TEXCOORD;
    float4 tangents : TANGENT;
};

struct OUTPUT2
{
    float4 posH : SV_POSITION;
    float3 posW : WORLD;
    float3 normW : NORMAL;
    float2 texCoord : TEXCOORD;
    float4 tangents : TANGENT;
};

cbuffer other_data
{
    matrix worldMatrix, viewMatrix, perspectiveMatrix;
    vector lightColour, ambientLight;
    vector lightDir, camPos;
};


OUTPUT2 main(shaderVars input : POSITION) : SV_POSITION 
{
    //temp hard coded data - till the texture data is used in lab 6
    static float4 diffuse = { 0.75f, 0.75f, 0.25f, 0.0f };
    static float4 specular = { 1.0f, 1.0f, 1.0f, 1.0f };
    static float4 emissive = { 0.0f, 0.0f, 0.0f, 1.0f };
    static float ns = 100.0f;
    
    //matrix result = mul(worldMatrix, viewMatrix);
    //result = mul(result, perspectiveMatrix);
    //float4 pos = mul(float4(input.pos, 1), result);
    
    float4 worldPos = mul(float4(input.pos, 1), worldMatrix);
    float4 viewPos = mul(worldPos, viewMatrix);
    float4 perspectivePos = mul(viewPos, perspectiveMatrix);
    
    float3 worldNorm = normalize(mul(input.norm, (float3x3) worldMatrix));
    
    OUTPUT2 output;
    output.posH = perspectivePos;
    output.posW = worldPos;
    output.normW = worldNorm;
    output.texCoord = input.texCoords;
    output.tangents = input.tangents;
	return output;
}