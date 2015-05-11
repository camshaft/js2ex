var read = require('fs').readFileSync;
var acorn = require('acorn');

var str = read(process.argv[2], 'utf8');
var out = acorn.parse(str, {
  ecmaVersion: 6,
  sourceType: 'module'
});

process.stdout.write(JSON.stringify(out));