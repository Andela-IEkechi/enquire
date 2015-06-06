class CreateDoctorLists < ActiveRecord::Migration
  def change
    create_table :doctor_lists do |t|
      t.references :user, index: true
      t.references :hospital, index: true

      t.timestamps null: false
    end
    add_foreign_key :doctor_lists, :users
    add_foreign_key :doctor_lists, :hospitals
  end
end
