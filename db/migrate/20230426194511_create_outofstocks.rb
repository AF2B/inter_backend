class CreateOutofstocks < ActiveRecord::Migration[7.0]
  def change
    create_table :outofstocks do |t|
      t.references :ong, null: false, foreign_key: true
      t.string :product
      t.integer :quantity
      t.decimal :weight

      t.timestamps
    end
  end
end
