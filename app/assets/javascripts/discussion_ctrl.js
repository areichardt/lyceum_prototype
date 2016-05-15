(function() {
  angular.module("app").controller("discussionCtrl", function($scope, $http) {
    
    $scope.setup = function() {
      $http.get('/api/comments.json').then(function(response) {
        $scope.comments= response.data;
      });
    };

  

    // $scope.toggleBio = function(inputComment) {
    //   inputPerson.bioVisible = !inputComment.bioVisible;
    // };


    window.$scope = $scope;

  
  });
})();