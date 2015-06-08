class CreateHospitalLists < ActiveRecord::Migration
  def change
    create_table :hospital_lists do |t|
      t.references :user, index: true
      t.references :hospital, index: true

      t.timestamps null: false
    end
    add_foreign_key :hospital_lists, :users
    add_foreign_key :hospital_lists, :hospitals
  end
end
