
static const char* PhongFSH = STRINGIFY
(
 // Varying
 varying highp vec3 vNormal;
 varying highp vec2 vTexel;

 // Uniforms
 uniform highp vec3 uDiffuse;
 uniform highp vec3 uSpecular;
 uniform sampler2D uTexture;

 void main(void)
{
    // 1
    // Material
    highp vec3 ka = vec3(0.05);
    highp vec3 kd = uDiffuse;
    highp vec3 ks = uSpecular;
    highp float alpha = 1.0;
    
    // 2
    // Light
    highp vec3 ia = vec3(1.0);
    highp vec3 id = vec3(1.0);
    highp vec3 is = vec3(1.0);
    
    // 3
    // Vectors
    highp vec3 L = normalize(vec3(1.0, 1.0, 1.0));
    highp vec3 N = normalize(vNormal);
    highp vec3 V = normalize(vec3(0.0, 0.0, 1.0));
    highp vec3 R = reflect(L, N);
    
    // 4
    // Illumination factors
    highp float df = max(0.0, dot(L, N));
    highp float sf = pow(max(0.0, dot(R, V)), alpha);
    
    // 5
    // Phong reflection equation
    highp vec3 Ip = ka*ia + kd*id*df + ks*is*sf;
    
    highp vec4 decal = texture2D(uTexture, vTexel);
    
    highp vec3 surface;
    if (decal.a > 0.0) {
        surface = decal.rgb;
    } else {
        surface = Ip;
    }
    
    gl_FragColor = vec4(surface, 1.0);
}
 
);
