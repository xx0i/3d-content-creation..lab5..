// an ultra simple hlsl vertex shader
struct shaderVars
{
    float3 position : POSITION;
};

float4 main(shaderVars input : POSITION) : SV_POSITION 
{
	return float4(input.position, 1);
}