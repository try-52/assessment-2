class RemoveCategoryFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :category, :string
  end
end
