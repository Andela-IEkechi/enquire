class AddUserToHospital < ActiveRecord::Migration
  def change
    add_reference :hospitals, :user, index: true
    add_foreign_key :hospitals, :users
  end
end
