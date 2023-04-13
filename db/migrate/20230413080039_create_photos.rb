class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :description
      t.string :image
      t.references :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
