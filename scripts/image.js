const { argv } = require('yargs')
const globby = require('globby')
const sharp = require('sharp');

const { generateOre } = require('./ore')
const { makeIcon, makeIconSet } = require('./icon')

const main = async (argv) => {
  const { _: [ action ] } = argv;

  if (action === 'icon') {
    makeIcon({ argv });
  } else if (action === 'iconset') {
    makeIconSet(argv._[1]);
  } else if (action === 'ore') {
    generateOre({ argv })
  }
}

try {
  main(argv)
} catch(e) {
  console.error(e);
}
