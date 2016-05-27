var express = require('express');
var router = express.Router();

var client = require('../db/connection');

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('index', {
		title: 'StarkMap',
		ruta: '/bloques/json/list'
	});
});

/**
 * =============================================================================
 * 																	SEDES
 * =============================================================================
 */
/* GET sedes json. */
router.get('/sedes', function(req, res, next) {
	var query = client.query("SELECT * FROM Sede;");
	query.on("row", function(row, result) {
		result.addRow(row);
	});

	query.on("end", function(result) {
		res.json({
			"layers": result.rows,
			title: 'Sedes'
		});
	});
});

/* GET Bloque form. */
router.get('/sedes_form', function(req, res, next) {
	res.render('sede/sede_list', {
		title: 'Sedes'
	});
});


/**
 * =============================================================================
 * 																	Salas
 * =============================================================================
 */
/* GET Salas json. */
router.get('/rf', function(req, res, next) {
	var query = client.query("SELECT rf.*, b.NumBloque, tr.Descripcion as tiporecurso FROM RecursoFisico AS rf " +
		"INNER JOIN Bloque AS b " +
		"ON b.idBloque = rf.fk_idBloque " +
		"INNER JOIN TipoRecursoFisico as tr " +
		"ON tr.idTipoRecursoFisico = rf.fk_idTipoRecursoFisico; "
	);
	query.on("row", function(row, result) {
		result.addRow(row);
	});

	query.on("end", function(result) {
		res.json({
			"layers": (result.rows),
			title: 'Salas'
		});
	});
});


/* GET Bloque form. */
router.get('/recursos_fisicos_form', function(req, res, next) {
	res.render('recurso_fisico/rf_list', {
		title: 'Recursos Fisicos'
	});
});


/**
 * =============================================================================
 * 															TipoRecursoFisico
 * =============================================================================
 */
/* GET TipoRecursoFisico json. */
router.get('/trf', function(req, res, next) {
	var query = client.query("SELECT * FROM TipoRecursoFisico;");
	query.on("row", function(row, result) {
		result.addRow(row);
	});

	query.on("end", function(result) {
		res.json({
			"layers": (result.rows),
			title: 'Tipos de Recursos Fisicos'
		});
	});
});


/* GET tipos_recursos_fisicos form. */
router.get('/tipos_recursos_fisicos_form', function(req, res, next) {
	res.render('tipos_recursos/tipo_recurso_list', {
		title: 'Recursos Fisicos'
	});
});


module.exports = router;
