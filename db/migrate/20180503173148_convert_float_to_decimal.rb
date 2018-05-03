class ConvertFloatToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :amount, :decimal
  end
end
