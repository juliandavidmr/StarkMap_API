const express = require('express');
const router = express.Router();
const db_u = require('../db/db_usuario');

const dir = '../public/';

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

// Login
router.get('/login', function(req, res) {
	res.render(dir + 'views/usuario/login');
});

/*
  GET: Menu de usuario
  user
 */
router.get('/sign_up', function(req, res) {
	//console.log("usuario: " + req.user);
	res.render(dir + 'views/sign_up');
});

/*
  POST: Registro
  list sensor
 */
router.post('/sign_up', function(req, res, next) {
	var new_user = {
		name: req.body.nombre,
		password: req.body.password,
		username: req.body.username,
		admin: 0,
		apellido: req.body.apellido
	}
	db_u.insertUsuario(new_user, function(row, est) {
		if (row > 0) {
			res.redirect('/usuarios/login');
		} else {
			res.send('No se registro');
		}
	});
});

router.post('/login', passport.authenticate('local', {
		successRedirect: '/',
		failureRedirect: '/usuarios/login',
		failureFlash: true
	}),
	function(req, res) {
		console.log("logon");
		req.flash('success_msg', 'You are In');
		res.redirect('/');
	});

// router.get('/logout', function(req, res){
// 	req.logout();

// 	req.flash('success_msg', 'You are logged out');

// 	res.redirect('/users/login');
// });
module.exports = router;
