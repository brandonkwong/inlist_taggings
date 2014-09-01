inlistApp.controller('InListCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.taggings = function() {
    var data = $http.get('/api/' + $scope.tagQuery).success(function(tag, status, headers, config) {
      $scope.tag = tag;      
    });
  };

}]);