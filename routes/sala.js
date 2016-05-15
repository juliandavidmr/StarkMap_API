const express 		= require('express');
const router 			= express.Router();

import { SalaDB } from "../db/db_sala";

const dir = '../public/';

router.get('/', function(req, res) {
  new SalaDB().getSalas(function(rows) {
    res.json({
      salas: rows
    });
  });
});

module.exports = router;
