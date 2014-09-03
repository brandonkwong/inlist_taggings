inlistApp.controller('InListCtrl', ['$scope', '$http', function($scope, $http) {

  // Change $scope.tag based on the tag query
  $scope.taggings = function() {
    // Perform a GET request based on the tag query
    var data = $http.get('/api/' + $scope.tagQuery).success(function(tag, status, headers, config) {
      // Assign $scope.tag to the tag query
      $scope.tag = tag;
    });
  };

}]);


// inlistApp.controller('InListCtrl', ['$scope', 'Tag', function($scope, Tag) {


//   // Tag.get
//   // Tag.update

//   $scope.tags = {};

//   Tag.query(function(json) {
//     $scope.tags = json;
//   });

// }]);