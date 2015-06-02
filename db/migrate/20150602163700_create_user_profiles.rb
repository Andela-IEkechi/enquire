class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
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

      t.timestamps null: false
    end
    add_foreign_key :user_profiles, :users
  end
end
