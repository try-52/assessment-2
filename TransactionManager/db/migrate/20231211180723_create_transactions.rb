class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.text :description
      t.string :category
      t.float :amount
      t.string :bank_name
      t.boolean :archived

      t.timestamps
    end
  end
end
