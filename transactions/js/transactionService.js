
app.factory('transactionService', function ($http, $q) {
  var service = {};
  var baseUrl = 'http://127.0.0.1:3000/api/v1/transactions';
	var categoryUrl = 'http://127.0.0.1:3000/api/v1/categories'
  service.getTransactions = function () {
		return $http.get(baseUrl)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.deleteTransaction = function (transactionId) {
		return $http.delete(baseUrl + '/' + transactionId)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.updateTransaction = function (transaction) {
		return $http.put(baseUrl + '/' + transaction.id, transaction)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.getCategories = function () {
		return $http.get(categoryUrl)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.addTransaction = function (transaction) {
		return $http.post(baseUrl, transaction)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.getArchivedTransactions = function () {
		return $http.get(baseUrl + '/archive')
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };

  service.getFilteredTransactions = function (filterUrl) {
		return $http.get(filterUrl)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
    };


  service.deleteCategory = function (categoryId) {
    return $http.delete(categoryUrl + '/' + categoryId)
			.then(function (response) {
					return response.data;
			})
			.catch(function (error) {
					return $q.reject(error);
			});
  };

service.addCategory = function (category) {
	return $http.post(categoryUrl, category)
		.then(function (response) {
				return response.data;
		})
		.catch(function (error) {
				return $q.reject(error);
		});
  };
  return service;
});
