inlistApp.controller('InListCtrl', ['$scope', 'Tag', function($scope, Tag) {

  // Tag.get
  // Tag.update

  $scope.tags = {};

  Tag.query(function(json) {
    $scope.tags = json;
  });

  $scope.tagQuery = {name: ''};

}]);
