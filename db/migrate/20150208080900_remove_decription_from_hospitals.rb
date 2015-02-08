class RemoveDecriptionFromHospitals < ActiveRecord::Migration
  def change
    remove_column :hospitals, :decription, :string
  end
end
