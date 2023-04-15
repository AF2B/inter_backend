class AddIsActiveToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_donors, :boolean
  end
end
