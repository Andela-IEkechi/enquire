class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.text :name
      t.text :description
      t.string :image
      t.boolean :verified, default: false
      t.text :address
      t.string :type

      t.timestamps null: false
    end
  end
end
