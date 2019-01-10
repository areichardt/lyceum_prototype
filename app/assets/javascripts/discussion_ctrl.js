(function() {
  angular.module("app").controller("discussionCtrl", function($scope, $http, $timeout) {

    var myDataRef = new Firebase('https://crackling-inferno-8576.firebaseio.com/');

    $scope.setup = function(comment_id, email) {
      $scope.comment_id = comment_id;
      $scope.email = email;
      // $http.get('/api/comments.json').then(function(response) {
      //   $scope.comments= response.data;
      // });
      $scope.messages = [];
      myDataRef.on('child_added', function(snapshot) {
        $timeout(function() {
          var message = snapshot.val();
          if (message.comment_id === $scope.comment_id) {
            $scope.messages.push(message);
          } else {
            console.log('problem', message, $scope.comment_id);
          }
        });
      });
    


    };

    $scope.createMessage = function(inputText) {
      // console.log('hello');
      myDataRef.push({name: $scope.email, text: inputText, comment_id: $scope.comment_id});
      $scope.newMessageText = '';
    };
  
    $scope.deleteMessage = function(inputIndex) {
     myDataRef.splice(inputIndex, 1);
    };
    // $scope.toggleBio = function(inputComment) {
    //   inputPerson.bioVisible = !inputComment.bioVisible;
    // };


    window.$scope = $scope;

  
  });
})();