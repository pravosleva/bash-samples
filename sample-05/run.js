var slugify = require('slugify-files');

slugify(
  ['./special.video/*.mp4'],
  function (err, sluggedFiles) {
    sluggedFiles.forEach(function(file, idx) {
      console.log(file.old, 'renamed to', file.new)
    })
  }
);
