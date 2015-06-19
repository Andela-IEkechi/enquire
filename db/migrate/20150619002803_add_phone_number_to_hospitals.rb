class AddPhoneNumberToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :phone_number, :string, default: ""
  end
end
