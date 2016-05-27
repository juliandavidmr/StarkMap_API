var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('puntos_interes/punto_interes_list');
});

module.exports = router;
