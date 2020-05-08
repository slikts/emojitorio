const globby = require('globby');
const sharp = require('sharp');

const makeIcon = async ({
  argv: {
    _: [, name],
  },
}) => {
  const [source] = await globby(`emojis/${name}*.png`);

  await _makeIcon(source, name);
};

const _makeIcon = async (source, target) => {
  const sizes = [64, 32, 16, 8];

  const icons = await Promise.all(
    sizes.map((size) => sharp(source).resize(size, size))
  );

  const result = await sharp({
    create: {
      width: sizes.reduce(add),
      height: Math.max(...sizes),
      channels: 4,
      background: { r: 0, g: 0, b: 0, alpha: 0 },
    },
  });

  const buffers = await Promise.all(icons.map((icon) => icon.toBuffer()));

  await result
    .composite(
      buffers.map((buffer, i) => ({
        input: buffer,
        top: 0,
        left: sizes.slice(0, i).reduce(add, 0),
      }))
    )
    .toFile(`src/graphics/icons/${target}.png`);
};

const makeIconSet = async (dir) => {
  const sources = await globby(`emojis/${dir}/*.png`);

  sources.forEach((source, i) => {
    _makeIcon(source, i ? `${dir}-${i}` : dir);
  });
};

const add = (a, b) => a + b;

exports.makeIcon = makeIcon;
exports.makeIconSet = makeIconSet;
