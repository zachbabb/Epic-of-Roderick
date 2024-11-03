var { gunzipSync } = require('zlib');

module.exports = (config) => {
console.log(config);
  const mapped = {};

  mapped.image = config.texture.name;
console.log(typeof config.texture.data);
  if(config.texture.data) {
    const imageBuffer = gunzipSync(Buffer.from(config.texture.data, 'base64'));
    mapped.imageData = 'data:image/png;base64,' + imageBuffer.toString('base64');
    console.log(mapped.imageData);
  }

  mapped.minX = +config.sourcePosition.x - +config.sourcePositionVariance.x;
  mapped.maxX = +config.sourcePosition.x + +config.sourcePositionVariance.x;
  mapped.minY = +config.sourcePosition.y - +config.sourcePositionVariance.y;
  mapped.maxY = +config.sourcePosition.y + +config.sourcePositionVariance.y;

  const degreesToRadians = (degrees) => degrees * Math.PI / 180;
  const roundToZero = (value) => value < 0.01 ? 0 : value;
  mapped.minVX = +config.speed.value * roundToZero(Math.cos(degreesToRadians(+config.angle.value - +config.angleVariance.value)));
  mapped.maxVX = +config.speed.value * roundToZero(Math.cos(degreesToRadians(+config.angle.value + +config.angleVariance.value)));
  mapped.minVY = +config.speed.value * roundToZero(Math.sin(degreesToRadians(+config.angle.value - +config.angleVariance.value)));
  mapped.maxVY = +config.speed.value * roundToZero(Math.sin(degreesToRadians(+config.angle.value + +config.angleVariance.value)));

  mapped.minLifetime = +config.particleLifeSpan.value - +config.particleLifespanVariance.value;
  mapped.maxLifetime = +config.particleLifeSpan.value + +config.particleLifespanVariance.value;

  mapped.minAX = +config.gravity.x;
  mapped.maxAX = +config.gravity.x;
  mapped.minAY = +config.gravity.y;
  mapped.maxAY = +config.gravity.y;

  if(Math.abs(+config.radialAcceleration.value) > 0.01 || Math.abs(+config.tangentialAcceleration.value) > 0.01) {
console.log('this one.');
  } 

  mapped.minR = Math.floor(255 * (+config.startColor.red - +config.startColorVariance.red));
  mapped.maxR = Math.floor(255 * (+config.startColor.red + +config.startColorVariance.red));
  mapped.minG = Math.floor(255 * (+config.startColor.green - +config.startColorVariance.green));
  mapped.maxG = Math.floor(255 * (+config.startColor.green + +config.startColorVariance.green));
  mapped.minB = Math.floor(255 * (+config.startColor.blue - +config.startColorVariance.blue));
  mapped.maxB = Math.floor(255 * (+config.startColor.blue + +config.startColorVariance.blue));

  mapped.minR = Math.floor(255 * (+config.finishColor.red - +config.finishColorVariance.red));
  mapped.maxR = Math.floor(255 * (+config.finishColor.red + +config.finishColorVariance.red));
  mapped.minG = Math.floor(255 * (+config.finishColor.green - +config.finishColorVariance.green));
  mapped.maxG = Math.floor(255 * (+config.finishColor.green + +config.finishColorVariance.green));
  mapped.minB = Math.floor(255 * (+config.finishColor.blue - +config.finishColorVariance.blue));
  mapped.maxB = Math.floor(255 * (+config.finishColor.blue + +config.finishColorVariance.blue));

  mapped.maxParticles = config.maxParticles.value;

  mapped.minStartScale = +config.startParticleSize.value - +config.startParticleSizeVariance.value;
  mapped.maxStartScale = +config.startParticleSize.value + +config.startParticleSizeVariance.value;
  mapped.minEndScale = +config.finishParticleSize.value - +config.FinishParticleSizeVariance.value;
  mapped.maxEndScale = +config.finishParticleSize.value + +config.FinishParticleSizeVariance.value;

  return mapped;   
};
