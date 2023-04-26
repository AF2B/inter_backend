class CreateOngs < ActiveRecord::Migration[7.0]
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :password
      t.string :cnpj

      t.timestamps
    end
  end
end
