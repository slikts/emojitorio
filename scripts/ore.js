const globby = require('globby');
const sharp = require('sharp');

sharp.cache(false);

const generateOre = async ({
  argv: {
    _: [, name],
  },
}) => {
  const fileNames = await globby(`emojis/${name}/*.png`);
  const icons = await all(fileNames.map((fileName) => sharp(fileName)));

  const targetName = `src/graphics/entity/${name}.png`;
  const hrTargetName = `src/graphics/entity/hr-${name}.png`;

  const ore = await Ore({ icons });
  const hr = await sharp(await ore.png().toBuffer()); //.sharpen(1);

  console.log(hrTargetName);
  void (await hr.toFile(hrTargetName));

  console.log(targetName);
  void (await sharp(hrTargetName)
    .resize(512, 512)
    .sharpen(1)
    .toFile(targetName));
};

const Ore = async ({
  icons,
  chunkSize = 128,
  perChunk = 40,
  sides = 8,
  itemRatio = 0.125,
  marginRatio = 0.01,
  rotationRange = 30,
}) => {
  const result = await sharp({
    create: {
      width: sides * chunkSize,
      height: sides * chunkSize,
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 },
    },
  });

  const chunks = await all(
    range(sides)
      .map((row) => range(sides).map((col) => ({ row, col })))
      .flat()
      .map(async ({ row, col }) => {
        const top = row * chunkSize;
        const left = col * chunkSize;
        const input = await Chunk({
          icons,
          chunkSize,
          marginRatio,
          perChunk,
          itemRatio,
          rotationRange,
        });

        return {
          input,
          top,
          left,
        };
      })
  );

  return result.composite(chunks);
};

const Chunk = async ({
  icons,
  chunkSize,
  itemRatio,
  marginRatio,
  perChunk,
  rotationRange,
}) => {
  const chunk = await sharp({
    create: {
      width: chunkSize,
      height: chunkSize,
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 },
    },
  });
  const baseSize = chunkSize * itemRatio;
  const margin = chunkSize * marginRatio;

  const images = await all(
    range(perChunk).map(async () => {
      const top = Math.round(random(margin, chunkSize - margin, 0.5));
      const left = Math.round(random(margin, chunkSize - margin, 0.5));

      const randomSize = Math.round(random(baseSize * 0.5, baseSize, 0.5));
      const input = await icons[random(0, icons.length - 1)]
        .clone()
        .resize(randomSize)
        .rotate(random(-rotationRange, rotationRange, 0.5), {
          background: { r: 0, g: 0, b: 0, alpha: 0 },
        })
        .sharpen(1)
        .toBuffer();

      return {
        input,
        top,
        left,
      };
    })
  );

  return chunk.composite(images).png().toBuffer();
};

exports.generateOre = generateOre;

const range = (length) => Array.from({ length }, (_, i) => i);

const random = (min, max, bias = 1) =>
  Math.floor(((Math.random() + Math.random() * bias) / 2) * (max - min + 1)) +
  min;

const all = (values) => Promise.all(values);
