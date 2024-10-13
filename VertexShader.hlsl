// an ultra simple hlsl vertex shader
float4 main(float3 inputVertex : POSITION) : SV_POSITION 
{
	return float4(inputVertex, 1);
}