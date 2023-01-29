varying vec2 vUv;
uniform float uTime;

void main() {
  vec2 uv = vUv;

  // vec3 RED = vec3(0.831, 0.247, 0.552);
  // vec3 BLUE = vec3(0.007, 0.313, 0.772);

  // vec3 color = mix(RED, BLUE, 0.5);
  // gl_FragColor = vec4(color, 1.0);
  uv.x = sin(uTime * 0.5);
  // uv.y = cos(uTime);

  gl_FragColor = vec4(vec3(uv, 1.0), 1.0);
}