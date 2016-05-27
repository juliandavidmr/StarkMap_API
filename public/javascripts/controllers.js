angular.module('App', [])

.controller('ControllerBloque', function($scope, $http) {
  $scope.bloques = [];

  $http.get("http://starkmap-sigudla.rhcloud.com/bloques/json/list")
    .then(function(response) {
      $scope.bloques = response.data.layers;
      console.log(JSON.stringify($scope.bloques));
    });
})

.controller('ControllerSede', function($scope, $http) {
  $scope.bloques = [];

  $http.get("http://starkmap-sigudla.rhcloud.com/sedes")
    .then(function(response) {
      $scope.sedes = response.data.layers;
      console.log(JSON.stringify($scope.sedes));
    });
})

.controller('ControllerRecursoFisicos', function($scope, $http) {
  $scope.rfs = [];

  $http.get("http://starkmap-sigudla.rhcloud.com/rf")
    .then(function(response) {
      $scope.rfs = response.data.layers;
      console.log(JSON.stringify($scope.rfs));
    });
})

.controller('ControllerTipoRecursoFisicos', function($scope, $http) {
  $scope.trfs = [];

  $http.get("http://starkmap-sigudla.rhcloud.com/trf")
    .then(function(response) {
      $scope.trfs = response.data.layers;
      console.log(JSON.stringify($scope.trfs));
    });
});
