class CreateDoctorProfiles < ActiveRecord::Migration
  def change
    create_table :doctor_profiles do |t|
      t.references :user, index: true
      t.date :date_of_birth
      t.string :gender
      t.text :address
      t.integer :phone_number
      t.string :ethnicity
      t.string :occupation
      t.string :religion
      t.string :marital_status
      t.float :weight
      t.float :height
      t.string :year_of_grad
      t.string :specialization

      t.timestamps null: false
    end
    add_foreign_key :doctor_profiles, :users
  end
end
