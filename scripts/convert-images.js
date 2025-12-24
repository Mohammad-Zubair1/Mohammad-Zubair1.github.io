#!/usr/bin/env node
// Simple image converter: converts png/jpg files in a folder to WebP using sharp
// Usage: node convert-images.js ./screenshots --quality 80

const sharp = require("sharp");
const fs = require("fs");
const path = require("path");

const args = process.argv.slice(2);
const inputDir = args[0] || "./screenshots";
const quality = parseInt((args[1] && args[1].split("=")[1]) || args[2]) || 80;

if (!fs.existsSync(inputDir)) {
  console.error("Input folder does not exist:", inputDir);
  process.exit(1);
}

const exts = [".png", ".jpg", ".jpeg"];

(async () => {
  const files = fs.readdirSync(inputDir);
  for (const f of files) {
    const ext = path.extname(f).toLowerCase();
    if (!exts.includes(ext)) continue;
    const infile = path.join(inputDir, f);
    const outfile = path.join(inputDir, path.basename(f, ext) + ".webp");
    try {
      await sharp(infile).webp({ quality }).toFile(outfile);
      console.log("Converted:", infile, "->", outfile);
    } catch (err) {
      console.error("Failed to convert", infile, err.message);
    }
  }
})();
