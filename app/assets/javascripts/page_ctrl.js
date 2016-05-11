(function() {
  angular.module("app").controller("pageCtrl", function($scope, $http) {
    
    $scope.setup = function() {
      $http.get('/api/circles.json').then(function(response) {
        $scope.circle = response.data;
      });
    };

     window.$scope = $scope;

  
  });
})();