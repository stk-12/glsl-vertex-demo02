varying vec2 vUv;
uniform float uTime;

varying float vDistortion;

void main() {
  vec2 uv = vUv;

  // vec3 RED = vec3(0.831, 0.247, 0.552);
  // vec3 BLUE = vec3(0.007, 0.313, 0.772);
  // vec3 color = mix(RED, BLUE, 0.5);
  // gl_FragColor = vec4(color, 1.0);


  // uv.x = sin(uTime * 0.5);
  // uv.y = clamp(cos(uTime * 0.05), 0.3, 0.6);
  // gl_FragColor = vec4(vec3(uv, 1.0), 1.0);


  // gl_FragColor = vec4(vec3(uv, 1.0), 1.0);


  // float distortion = vDistortion * 0.003;
  // vec3 color = vec3(0.007, 0.313, 0.772);
  // color = vec3(color.r + distortion, color.g + distortion, color.b + distortion);
  // gl_FragColor = vec4(color, 1.0);


  float distortion = vDistortion * 0.003;
  vec3 RED = vec3(0.831, 0.247, 0.552);
  vec3 BLUE = vec3(0.007, 0.313, 0.772);
  vec3 color1 = vec3(RED.r + distortion, RED.g + distortion, RED.b + distortion);
  vec3 color2 = vec3(BLUE.r + distortion, BLUE.g + distortion, BLUE.b + distortion);
  vec3 color = mix(color1, color2, sin(uTime * 0.2) * 0.5 + 0.5);
  gl_FragColor = vec4(color, 1.0);

}