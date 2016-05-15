'use strict';

const knex = require('./connection');

export class BloqueDB {

	constructor() {
	}

	getBloques(callback) {
		knex
			.select('*')
			.from('Bloque')
			.limit(100)
			.orderBy('NumBloque', 'desc')
			.then(function(rows) {
				callback(rows, true);
			})
			.catch(function(error) {
				console.error("ERROR " + error)
			});
	};

	getTiposSensores_Sensor(callback) {
		knex
			.select(['Dato', 'Dato.insertDate', 'Dato.updateDate', 'Sensor.NombreSensor'])
			.from('Dato')
			.orderBy('Dato.insertDate', 'DESC')
			.innerJoin('Sensor', 'Sensor.idSensor', 'Dato.fk_idSensor')
			.limit(100)
			.then(function(rows) {
				callback(rows);
			})
			.catch(function(error) {
				console.error("ERROR " + error)
			});
	};

	getSensorById(idSensor, callback) {
		knex.where('idSensor', '=', idSensor)
			.select('*')
			.from('Sensor')
			.innerJoin('TipoSensor', 'TipoSensor.idTipoSensor', 'Sensor.fk_idTipoSensor')
			.limit(1)
			.then(function(row) {
				callback(row);
			})
			.catch(function(error) {
				console.error("ERROR " + error)
			});
	};
}
