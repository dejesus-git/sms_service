class AddBalanceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :balance, :decimal, precision: 8, scale: 2, default: BigDecimal.new("0.00"), null: false
  end
end
