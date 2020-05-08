const globby = require('globby')
const sharp = require('sharp');


const generateOre = async ({ argv: { _: [, name ] } }, chunkSize = 128, proportion = 0.125) => {
  const fileNames = await globby(`emojis/${name}/*.png`);
  const icons = await Promise.all(fileNames.map(fileName => sharp(fileName)))
  
  void (await generate({ icons, chunkSize: 128 }))
    // .sharpen(100)
    .toFile(`src/graphics/entity/hr-${name}.png`)
  // generate({ icons, chunkSize: 64, outName: name })
}

const generate = async ({ icons, chunkSize = 128, proportion = 0.125, outName }) => {
  const baseSize = chunkSize * proportion
  const chunks = 8

  const result = await sharp({
    create: {
      width: chunks * chunkSize,
      height: chunks * chunkSize,
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 }
    }
  });
  
  const perChunk = 40
  const margin = 0.01
  const images = []

  for (const row of range(chunks)) {
    for (const col of range(chunks)) {
      for (const _ of range(perChunk)) {
        const top = Math.round(random(margin * chunkSize, chunkSize - margin * chunkSize, 0.5))
        const left = Math.round(random(margin * chunkSize, chunkSize - margin * chunkSize, 0.5))
        const randomSize = Math.round(random(baseSize * 0.5, baseSize, 0.5))
        const buffer = await icons[random(0, icons.length - 1)]
          .resize(randomSize)
          .rotate(random(-30, 30, .5), {background: { r: 0, g: 0, b: 0, alpha: 0 }})
          .sharpen(1)
          .toBuffer()

        images.push({
          input: buffer,
          top: top + row * chunkSize,
          left: left + col * chunkSize
        })
      }
    }
  }

  return result.composite(images)
}

exports.generateOre = generateOre

const range = (length) => Array.from({ length }, (_, i) => i);

const random = (min, max, bias = 1) => Math.floor(((Math.random() + Math.random() * bias) / 2) * (max - min + 1)) + min;
