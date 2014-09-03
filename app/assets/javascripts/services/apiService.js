inlistApp.factory('API', ['$resource', function($resource) {

  return $resource('/api/tags/:id',
    {id: '@id'},
    {update: {method: 'PATCH'}});

  return $resource('/api/items/:id',
    {id: '@id'},
    {update: {method: 'PATCH'}});
  
}]);