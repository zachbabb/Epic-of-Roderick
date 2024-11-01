var fs = require('fs');
var path = require('path');
var parser = require('xml2json');
var p2s = require('./map-pex-2-savage.js');
 

const files = fs.readdirSync('../../Epic-of-Roderick/').filter(file => path.extname(file).toLowerCase() === '.pex');
console.log(files.length);

let count = 0;

const mapFileToJSON = (file) => { 
  const xml = fs.readFileSync('../../Epic-of-Roderick/' + files[0]);
  var json = parser.toJson(xml);
  console.log("to json -> %s", json);

  const obj = JSON.parse(json);

  console.log('and then mapped is:');
  var mapped = p2s(obj.particleEmitterConfig);
  console.log(mapped);
  count++;
};

files.forEach(file => mapFileToJSON(file));

console.log('converted ' + count + ' of ' + files.length + ' emitters to SaVaGe');
