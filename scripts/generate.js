// https://github.com/foliojs/fontkit/issues/229
/*
const fs = require('fs');
const fontkit = require('fontkit');
const emoji = require('node-emoji');
const { createCanvas } = require('canvas')

const font = fontkit.openSync('./seguiemj.ttf');

const generate = async (name, size = 64) => {
  const canvas = createCanvas(size, size);
  const ctx = canvas.getContext('2d');
  
  const string = emoji.get(name);
  const [ glyph ] = font.glyphsForString(string);
  const COLRGlyph = Object.getPrototypeOf(glyph).constructor;

  render(glyph, ctx);

  const stream = canvas.createPNGStream()
  stream.pipe(fs.createWriteStream(`${name}.png`))
}

exports.generate = generate;

const render = (glyph, ctx) => {
  for (const {glyph: subglyph, color} of glyph.layers) {
  const { red, green, blue, alpha } = color
  
  ctx.fillStyle = `rgb(${red}, ${green}, ${blue}, ${alpha / 255 * 100})`;
  }
}
*/
