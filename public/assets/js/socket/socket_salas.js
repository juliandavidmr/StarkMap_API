$(document).ready(function() {

  socket.on('datos salas', function(data) {
    console.log(JSON.stringify(data));
  });
});
