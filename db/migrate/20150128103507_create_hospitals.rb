class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.text :name
      t.text :decription
      t.text :address
      t.string :classification
      t.attachment :image
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
