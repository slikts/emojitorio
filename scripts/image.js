const { argv } = require('yargs')
const globby = require('globby')
const sharp = require('sharp');

const makeIcon = async ({ argv: { _: [, name ] } }) => {
  const [ source ] = await globby(`emojis/${name}*.png`)

  const sizes = [64, 32, 16, 8]

  const icons = await Promise.all(sizes.map(size => sharp(source).resize(size, size)))
  
  const result = await sharp({
    create: {
      width: sizes.reduce(add),
      height: Math.max(...sizes),
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 }
    }
  })

  const buffers = await Promise.all(icons.map(icon => icon.toBuffer()))
  
  await result.composite(buffers.map((buffer, i) => ({
    input: buffer,
    top: 0,
    left: sizes.slice(0, i).reduce(add, 0)
  }))).toFile(`src/graphics/icons/${name}.png`)
}

const main = async (argv) => {
  const { _: [ action ] } = argv;

  if (action === 'icon') {
    makeIcon({ argv });
  }
}

try {
  main(argv)
} catch(e) {
  console.error(e, 123);
}

const add = (a, b) => a + b;
