// an ultra simple hlsl vertex shader
float4 main(float2 inputVertex : POSITION) : SV_POSITION 
{
	return float4(inputVertex, 0, 1);
}