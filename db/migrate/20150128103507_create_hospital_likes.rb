class CreateHospitalLikes < ActiveRecord::Migration
  def change
    create_table :hospital_likes do |t|
      t.references :user, index: true
      t.references :hospital, index: true

      t.timestamps null: false
    end
    add_foreign_key :hospital_likes, :users
    add_foreign_key :hospital_likes, :hospitals
  end
end
