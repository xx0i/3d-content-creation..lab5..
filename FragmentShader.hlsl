// an ultra simple hlsl fragment shader
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
    vector lightColour;
    vector lightDir, camPos;
};

float4 main(OUTPUT2 input) : SV_TARGET
{
    //temp hard coded data - till the texture data is used in lab 6
    static float4 diffuse = { 0.75f, 0.75f, 0.25f, 0.0f };
    static float4 specular = { 1.0f, 1.0f, 1.0f, 1.0f };
    static float4 emissive = { 0.0f, 0.0f, 0.0f, 1.0f };
    static float4 ambient = { 0.62f, 0.50f, 0.50f, 0 };
    static float ns = 100.0f;
    
    
    float3 norm = normalize(input.normW);
    float3 lightDirection = normalize(lightDir);
    float diffuseIntensity = saturate(dot(norm, -lightDirection));
    float4 finalColour = (diffuseIntensity + ambient) * diffuse * lightColour;
    
    //half-vector method
    float3 viewDir = normalize(camPos.xyz - input.posW);
    float3 halfVect = normalize(-lightDirection.xyz + viewDir);
    float intensity = pow(saturate(dot(norm, halfVect)), ns);
    float3 reflected = lightColour.xyz * (float3) specular * intensity;
    finalColour += float4(reflected, 1.0f);

    return finalColour;
}