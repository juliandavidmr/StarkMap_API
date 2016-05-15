const express 		= require('express');
const router 			= express.Router();

const dir = '../public/';

/*
  GET: Pagina principal
  dashboard
 */
router.get('/', function(req, res) {
	res.render(dir + '/views/dashboard');
});

router.get('/maps', function(req, res) {
	res.render(dir + 'views/maps');
});

module.exports = router;
