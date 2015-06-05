class RemoveDoctorFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :doctor, :boolean
    change_column_default(:users, :role, "")
  end
end
