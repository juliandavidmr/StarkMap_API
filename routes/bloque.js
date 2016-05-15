const express 		= require('express');
const router 			= express.Router();

import { BloqueDB } from "../db/db_bloque";

const dir = '../public/';

router.get('/', function(req, res) {
  new BloqueDB().getBloques(function(rows) {
    res.json({
      bloques: rows
    });
  });
});

module.exports = router;
