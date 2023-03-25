

varying vec2 vUv;
uniform float uTime;
uniform float uSpeed;
uniform float uWave;
uniform float uFrequency;

varying float vDistortion;

#pragma glslify: cnoise = require(glsl-noise/classic/3d);


void main() {
  vUv = uv;

  float speed = uTime * uSpeed;

  vec3 pos = position;

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  // modelPosition.z += sin(modelPosition.y * uFrequency.y + uTime * 0.1) * uWave;
  // modelPosition.y += sin(modelPosition.x * uFrequency.x + uTime * 0.1) * uWave;
  // modelPosition.x += sin(modelPosition.z * uFrequency.z + uTime * 0.1) * uWave;

  // modelPosition.y += sin(modelPosition.x * uFrequency.x + uTime * 0.1) * uWave
  //                 *  sin(modelPosition.z * uFrequency.y + uTime * 0.1) * uWave;

  // noise = 10.0 *  -.10 * turbulence( .5 * normal );

  float b = uWave * cnoise(uFrequency * pos + speed * 0.1);

  float displacement = - 10. * b;

  vec3 newPosition = pos + normal * displacement;

  vDistortion = displacement;

  // vec4 viewPosition = viewMatrix * modelPosition;
  // vec4 projectionPosition = projectionMatrix * viewPosition;
  // gl_Position = projectionPosition;

  gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );
}