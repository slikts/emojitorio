const globby = require('globby')
const sharp = require('sharp');

const generateOre = async ({ argv: { _: [, name ] } }, chunkSize = 128, proportion = 0.125) => {
  const fileNames = await globby(`emojis/${name}/*.png`);
  const icons = await Promise.all(fileNames.map(fileName => sharp(fileName)))
  
  generate({ icons, chunkSize: 128, outName: `hr-${name}` })
  generate({ icons, chunkSize: 64, outName: name })


}
const generate = async ({ icons, chunkSize = 128, proportion = 0.125, outName }) => {
  const buffers = await Promise.all(icons.map(icon => icon
    .resize(chunkSize * proportion, chunkSize * proportion)
    .toBuffer()))
  const chunks = 8

  const result = await sharp({
    create: {
      width: chunks * chunkSize,
      height: chunks * chunkSize,
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 }
    }
  });
  
  const perChunk = 8
  const margin = 0.01
  const images = []

  for (const row of range(chunks)) {
    for (const col of range(chunks)) {
      for (const _ of range(perChunk)) {
        const top = Math.round(random(margin * chunkSize, chunkSize - margin * chunkSize, 0.5))
        const left = Math.round(random(margin * chunkSize, chunkSize - margin * chunkSize, 0.5))
        const input = buffers[random(0, buffers.length - 1)]

        images.push({
          input,
          top: top + row * chunkSize,
          left: left + col * chunkSize
        })
      }
    }
  }

  await result.composite(images).toFile(`src/graphics/entity/${outName}.png`)
}

exports.generateOre = generateOre

const range = (length) => Array.from({ length }, (_, i) => i);

const random = (min, max, bias = 1) => Math.floor(((Math.random() + Math.random() * bias) / 2) * (max - min + 1)) + min;
