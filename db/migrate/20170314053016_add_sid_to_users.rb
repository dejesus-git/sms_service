class AddSidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sid, :string
  end
end
