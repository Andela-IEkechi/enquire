class AddDescriptionToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :description, :text
  end
end
