var pg = require('pg');

var conString = process.env.OPENSHIFT_POSTGRESQL_DB_URL || "postgresql://postgres:root@127.0.0.1:5432/starkmap";

var client = new pg.Client(conString);
client.connect(function(err) {
  if(err) {
    return console.error('could not connect to postgres', err);
  }
  client.query('SELECT NOW() AS "theTime"', function(err, result) {
    if(err) {
      return console.error('error running query', err);
    }
    console.log(result.rows[0].theTime);
    //output: Tue Jan 15 2013 19:12:47 GMT-600 (CST)
    //client.end();
  });
});

module.exports = client;
