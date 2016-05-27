var express = require('express');
var router = express.Router();

var client = require('../db/connection');


/* GET Bloques json. */
router.get('/json/:limite_or_id', function(req, res, next) {
	console.log(req.params.limite_or_id);

	var limite = req.params.limite_or_id;
	if(limite == 'list' || limite <= 0 || !Number.isInteger(Number.parseInt(limite))) {
		limite = 'LIMIT 10000';
	} else {
		limite = 'WHERE Bloque.idBloque=' + limite;
	}

	console.log("limit: " + limite);

	var query = client.query("SELECT Bloque.*, Sede.NombreSede FROM Bloque" +
		" INNER JOIN Sede" +
		" ON Bloque.fk_idSede = Sede.idSede " +
		limite +
		";"
	);

	query.on("row", function(row, result) {
		result.addRow(row);
	});

	query.on("end", function(result) {
		res.json({
			"layers": (result.rows),
			title: 'Bloque #' + limite
		});
	});
});

/* GET Bloque form. */
router.get('/form', function(req, res, next) {
	res.render('bloque/bloque_list', {
		title: 'Bloques'
	});
});

/* GET Bloque form uno. */
router.get('/ver/:idBloque', function(req, res, next) {
	var idBloque = req.params.idBloque;

	if(Number.isInteger(Number.parseInt(idBloque))) { //Evitar que se haga una peticion con otra cosa diferente a un numero
		console.log(idBloque);
		return res.render('index', {
	    title: "StarkMap, B " + idBloque,
	    idBloque: idBloque,
	    ruta: "/bloques/json/" + idBloque
	  });
	} else {
		return res.render('index', {
			title: 'StarkMap',
			ruta: '/bloques/json/list'
		});
	}
});

module.exports = router;
