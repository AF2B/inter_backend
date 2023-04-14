class AddCnpjToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :cnpj, :string
  end
end
