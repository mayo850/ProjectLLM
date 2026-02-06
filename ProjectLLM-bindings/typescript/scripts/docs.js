//Maybe some command line piping would work better, but can't think of platform independent command line tool

const fs = require('fs');

const newPath = '../python/docs/ProjectLLM_nodejs.md';
const filepath = './README.md';
const intro = fs.readFileSync(filepath);

fs.writeFileSync(
    newPath, intro
);

