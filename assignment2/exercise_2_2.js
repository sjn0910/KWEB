const fs = require('fs');
const path = require('path');
const util = require('util');

const getFiles = util.promisify(fs.readdir);
const getFileStat = util.promisify(fs.stat);

const getJSFiles = async directory => {
    const files = await getFiles(directory);

    files.forEach(async file => {
        const filePath = path.join(directory, file);
        const fileStat = await getFileStat(filePath);

        if (fileStat.isDirectory()) await getJSFiles(filePath);
        else if(path.extname(filePath) === ".js") console.log(filePath);

    })
}

(async () => {
    try {
        await getJSFiles('./test');
    }
    catch (err) {
         console.error(err);
    }
})();   