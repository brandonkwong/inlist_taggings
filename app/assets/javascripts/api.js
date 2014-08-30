var inList = angular.module('InList', []);

inList.controller('InListCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.taggings = function() {
    var data = $http.get('http://localhost:3000/api/' + $scope.tagQuery).success(function(data, status, headers, config) {
      $scope.data = data;
    });
  };

}]);