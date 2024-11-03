var fs = require('fs');
var path = require('path');
var parser = require('xml2json');
var p2s = require('./map-pex-2-savage.js');
 

const files = fs.readdirSync('../../').filter(file => path.extname(file).toLowerCase() === '.pex');
console.log(files.length);

let count = 0;

const mapFileToJSON = (file) => { 
  const xml = fs.readFileSync('../../' + file);
  var json = parser.toJson(xml);
  console.log("to json -> %s", json);

  const obj = JSON.parse(json);

  console.log('and then mapped is:');
  var mapped = p2s(obj.particleEmitterConfig);
  console.log(mapped);
  fs.writeFileSync(`./json-emitters/${file.split('.')[0]}`, JSON.stringify(mapped));
  count++;
  return mapped;
};

let images = [];
files.forEach(file => {
  const json = mapFileToJSON(file);
  if(!json) return;
  images.push(json.image);
});
let foo = {};
console.log(images);
images.forEach(image => foo[image] = true);
console.log(foo);

console.log('converted ' + count + ' of ' + files.length + ' emitters to SaVaGe');
