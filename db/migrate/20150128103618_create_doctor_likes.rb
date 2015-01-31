class CreateDoctorLikes < ActiveRecord::Migration
  def change
    create_table :doctor_likes do |t|
      t.references :user, index: true
      t.references :doctor, index: true

      t.timestamps null: false
    end
    add_foreign_key :doctor_likes, :users
    add_foreign_key :doctor_likes, :doctors
  end
end
