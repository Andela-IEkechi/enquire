class ChangeHospitalColumn < ActiveRecord::Migration
  def change
    rename_column :users, :hospital, :hospital_id
    change_column :users, :hospital_id, 'integer USING CAST(hospital_id AS integer)'
    add_foreign_key :users, :hospitals, column: :hospital_id
  end
end
