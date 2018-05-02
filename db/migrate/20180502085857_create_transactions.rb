class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.integer :account_id
      t.date :date
      t.string :description
      t.timestamps
    end
  end
end
