class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :skills
      t.text :experience
      t.string :available_time
      t.string :location

      t.timestamps
    end
  end
end
