inlistApp.controller('InListCtrl', ['$scope', 'API', function($scope, API) {

  // Tag.get
  // Tag.update

  $scope.items = {};
  $scope.tags = {};

  API.query(function(json) {
    $scope.items = json;
    $scope.tags = json;
  });

  $scope.tagQuery = {name:''};

}]);

// inlistApp.controller('InListCtrl', ['$scope', '$http', function($scope, $http) {

//   // Change $scope.tag based on the tag query
//   $scope.taggings = function() {
//     // Perform a GET request based on the tag query
//     var data = $http.get('/api/' + $scope.tagQuery).success(function(tag, status, headers, config) {
//       // Assign $scope.tag to the tag query
//       $scope.tag = tag;
//     });
//   };

// }]);
