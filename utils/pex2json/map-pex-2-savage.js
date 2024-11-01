module.exports = (config) => {
console.log(config);
  const mapped = {};

  mapped.minX = +config.sourcePosition.x - +config.sourcePositionVariance.x;
  mapped.maxX = +config.sourcePosition.x + +config.sourcePositionVariance.x;
  mapped.minY = +config.sourcePosition.Y - +config.sourcePositionVariance.y;
  mapped.maxY = +config.sourcePosition.Y + +config.sourcePositionVariance.y;

  const degreesToRadians = (degrees) => degrees * Math.PI / 180;
  mapped.minVX = +config.speed.value * Math.cos(degreesToRadians(+config.angle.value - +config.angleVariance.value));
  mapped.maxVX = +config.speed.value * Math.cos(degreesToRadians(+config.angle.value + +config.angleVariance.value));
  mapped.minVY = +config.speed.value * Math.sin(degreesToRadians(+config.angle.value - +config.angleVariance.value));
  mapped.maxVY = +config.speed.value * Math.sin(degreesToRadians(+config.angle.value + +config.angleVariance.value));

  mapped.minLifetime = +config.particleLifeSpan.value - +config.particleLifespanVariance.value;
  mapped.maxLifetime = +config.particleLifeSpan.value + +config.particleLifespanVariance.value;

  mapped.minAX = config.gravity.x;
  mapped.maxAX = config.gravity.x;
  mapped.minAY = config.gravity.y;
  mapped.maxAY = config.gravity.y;

  if(Math.abs(+config.radialAcceleration.value) > 0.01 || Math.abs(+config.tangentialAcceleration.value) > 0.01) {
console.log('this one.');
  } 

  mapped.startColor = {
    minR: Math.floor(255 / (+config.startColor.red - +config.startColorVariance.red)),
    maxR: Math.floor(255 / (+config.startColor.red + +config.startColorVariance.red)),
    minG: Math.floor(255 / (+config.startColor.green - +config.startColorVariance.green)),
    maxG: Math.floor(255 / (+config.startColor.green + +config.startColorVariance.green)),
    minB: Math.floor(255 / (+config.startColor.blue - +config.startColorVariance.blue)),
    maxB: Math.floor(255 / (+config.startColor.blue + +config.startColorVariance.blue))
  };

  mapped.endColor = {
    minR: Math.floor(255 / (+config.finishColor.red - +config.finishColorVariance.red)),
    maxR: Math.floor(255 / (+config.finishColor.red + +config.finishColorVariance.red)),
    minG: Math.floor(255 / (+config.finishColor.green - +config.finishColorVariance.green)),
    maxG: Math.floor(255 / (+config.finishColor.green + +config.finishColorVariance.green)),
    minB: Math.floor(255 / (+config.finishColor.blue - +config.finishColorVariance.blue)),
    maxB: Math.floor(255 / (+config.finishColor.blue + +config.finishColorVariance.blue))
  };

  mapped.maxParticles = config.maxParticles.value;

  mapped.minStartScale = +config.startParticleSize.value - +config.startParticleSizeVariance.value;
  mapped.maxStartScale = +config.startParticleSize.value + +config.startParticleSizeVariance.value;
  mapped.minEndScale = +config.finishParticleSize.value - +config.FinishParticleSizeVariance.value;
  mapped.maxEndScale = +config.finishParticleSize.value + +config.FinishParticleSizeVariance.value;

  return mapped;   
};
