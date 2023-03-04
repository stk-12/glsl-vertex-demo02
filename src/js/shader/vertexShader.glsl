

varying vec2 vUv;
uniform float uTime;
uniform float uWave;
// uniform vec2 uFrequency;
uniform vec3 uFrequency;



#pragma glslify: cnoise = require(glsl-noise/classic/3d);


void main() {
  vUv = uv;
  vec3 pos = position;

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  // modelPosition.z += sin(modelPosition.y * uFrequency.y + uTime * 0.1) * uWave;
  // modelPosition.y += sin(modelPosition.x * uFrequency.x + uTime * 0.1) * uWave;
  // modelPosition.x += sin(modelPosition.z * uFrequency.z + uTime * 0.1) * uWave;

  // modelPosition.y += sin(modelPosition.x * uFrequency.x + uTime * 0.1) * uWave
  //                 *  sin(modelPosition.z * uFrequency.y + uTime * 0.1) * uWave;

  // noise = 10.0 *  -.10 * turbulence( .5 * normal );

  float b = uWave * cnoise(0.05 * pos + uTime * 0.1);

  float displacement = - 10. * b;

  vec3 newPosition = pos + normal * displacement;

  // vec4 viewPosition = viewMatrix * modelPosition;
  // vec4 projectionPosition = projectionMatrix * viewPosition;
  // gl_Position = projectionPosition;

  gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );
}