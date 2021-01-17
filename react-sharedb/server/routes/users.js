var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.json([
    { id: 1, username: "이연주" },
    { id: 2, username: "모시기모시기" },
  ]);
});

module.exports = router;
