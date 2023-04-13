class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.text :description
      t.date :validity
      t.references :donor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
