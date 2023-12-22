app.controller('myController', function($scope, transactionService, $location) {
  $scope.transactions = [];
  $scope.showEditForm = false;
  $scope.editedTransaction = {};
  $scope.newCategory = {};

  $scope.categories = [];
  $scope.editMode = false;
  $scope.selectedCategoryName = '';

  // filter variables
  $scope.categoryFilter = '';
  $scope.startDateFilter = '';
  $scope.endDateFilter = '';
  $scope.periodFilter = '';
  $scope.titleFilter = '';
  $scope.bankNameFilter = '';

  transactionService.getTransactions().then(function(response) {
    $scope.transactions = response;
  }).catch(function(error) {
    console.error('Error fetching data:', error);
  });

  //  show all transactions
  $scope.showAllTransactions = function() {
    transactionService.getTransactions().then(function(response) {
      $scope.transactions = response;
    }).catch(function(error) {
      console.error('Error fetching all transactions:', error);
    });
  };

  // delete a transaction
  $scope.deleteTransaction = function(transaction) {
    transactionService.deleteTransaction(transaction.id).then(function(response) {
      // Remove the transaction from the local data if the server delete is successful
      var index = $scope.transactions.indexOf(transaction);
      $scope.transactions.splice(index, 1);
      console.log('Transaction deleted successfully');
    }).catch(function(error) {
      console.error('Error deleting transaction:', error);
    });
  };

  // edit a transaction
  $scope.editTransaction = function(transaction) {
    // Show the edit form
    console.log('here in edit');
    $scope.showEditForm = true;
    $scope.editMode = true;
    // Pre-fill the form fields with the selected transaction's data
    $scope.editedTransaction = angular.copy(transaction);
    // Set the selected category in the dropdown
    $scope.editedTransaction.category_id = transaction.category_id.toString();
    // Set the selected category name for display in the form
    $scope.selectedCategoryName = $scope.getCategoryName(transaction.category_id);
  };

  // update a transaction
  $scope.updateTransaction = function() {
    transactionService.updateTransaction($scope.editedTransaction).then(function(response) {
      var index = $scope.transactions.findIndex(t => t.id === $scope.editedTransaction.id);
      $scope.transactions[index] = response;
      // Fetch the updated data from the server and hide form
      transactionService.getTransactions().then(function(response) {
        $scope.transactions = response;
      }).catch(function(error) {
        console.error('Error fetching updated data:', error);
      });
    $scope.cancelEdit();
  }).catch(function(error) {
    console.error('Error updating transaction:', error);
  });
};

  // cancel editing and hide the form
  $scope.cancelEdit = function() {
    $scope.showEditForm = false;
    $scope.editMode = false;
    $scope.editedTransaction = {};
    $scope.selectedCategoryName = '';
  };

  // Fetch categories
  transactionService.getCategories().then(function(response) {
    $scope.categories = response;
  }).catch(function(error) {
    console.error('Error fetching categories:', error);
  });

  // get the name of a category based on its ID
  $scope.getCategoryName = function(categoryId) {
    if ($scope.categories && $scope.categories.length > 0) {
      var category = $scope.categories.find(function(cat) {
        return cat.id === categoryId;
      });
      return category ? category.name : '';
    }
    return '';
  };

  // add a new transaction
  $scope.addTransaction = function() {
    transactionService.addTransaction($scope.editedTransaction).then(function(response) {
      // Fetch the updated data from the server
      transactionService.getTransactions().then(function(response) {
        $scope.transactions = response;
      }).catch(function(error) {
        console.error('Error fetching updated data:', error);
      });
      // Hide the form after adding
      $scope.cancelEdit();
    }).catch(function(error) {
      console.error('Error adding new transaction:', error);
    });
  };

  // show the form for adding a new transaction
  $scope.showAddForm = function() {
    console.log('Showing add form...');
    $scope.editedTransaction = {
      archived: false
    };
    $scope.showEditForm = true;
    $scope.editMode = false;
    $scope.selectedCategoryName = '';
  };

  // show archived transactions
  $scope.showArchivedTransactions = function() {
    transactionService.getArchivedTransactions().then(function(response) {
      $scope.transactions = response;
    }).catch(function(error) {
      console.error('Error fetching archived transactions:', error);
    });
  };

  // apply filters
  $scope.applyFilters = function() {
    var filterUrl = 'http://127.0.0.1:3000/api/v1/transactions/filter?';
    if ($scope.categoryFilter) filterUrl += '&category=' + $scope.categoryFilter;
    if ($scope.startDateFilter) filterUrl += '&start_date=' + $scope.startDateFilter;
    if ($scope.endDateFilter) filterUrl += '&end_date=' + $scope.endDateFilter;
    if ($scope.periodFilter) filterUrl += '&period=' + $scope.periodFilter;
    if ($scope.titleFilter) filterUrl += '&title=' + $scope.titleFilter;
    if ($scope.bankNameFilter) filterUrl += '&bank_name=' + $scope.bankNameFilter;
    console.log($scope, filterUrl)
    transactionService.getFilteredTransactions(filterUrl).then(function(response) {
        $scope.transactions = response;
    }).catch(function(error) {
        console.error('Error fetching filtered transactions:', error);
    });
  };

  //reset filters
  $scope.resetFilters = function() {
    $scope.categoryFilter = '';
    $scope.startDateFilter = '';
    $scope.endDateFilter = '';
    $scope.periodFilter = '';
    $scope.titleFilter = '';
    $scope.bankNameFilter = '';
    // Fetch all transactions (resetting filters)
    transactionService.getTransactions().then(function(response) {
      $scope.transactions = response;
    }).catch(function(error) {
      console.error('Error fetching all transactions:', error);
    });
  };

    // delete a category
    $scope.deleteCategory = function(category) {
      console.log("here")
      console.log(category)
      transactionService.deleteCategory(category.id).then(function(response) {
        // Remove the category from the local data if the server delete is successful
        var index = $scope.categories.indexOf(category);
        $scope.categories.splice(index, 1);
        console.log('category deleted successfully');
      }).catch(function(error) {
        console.error('Error deleting category:', error);
    });
  };

  $scope.navigateToCategories = function () {
    $scope.newCategory = {};
    $scope.isCategoriesPage = true;
  };

    // Function to add a new transaction
  $scope.addCategory = function() {
    transactionService.addCategory($scope.newCategory).then(function(response) {
      // Fetch the updated data from the server
      // $scope.categories.push($scope.newCategory)
      $scope.newCategory = {};
      transactionService.getCategories().then(function(response) {
        $scope.categories = response;
      }).catch(function(error) {
        console.error('Error fetching updated data:', error);
      });
      transactionService.getTransactions().then(function(response) {
        $scope.transactions = response;
      }).catch(function(error) {
        console.error('Error fetching updated data:', error);
      });
    }).catch(function(error) {
      console.error('Error adding new Category:', error);
    });
  };
});
