class AddDefaultHospital < ActiveRecord::Migration
  def change
    change_column_default(:hospitals, :verified, false)
  end
end
