class AddDoctor < ActiveRecord::Migration
  def self.up
    Doctor.create!(name:  'All Doctors',
                   email: "doctor@example.com",
                   password: "password1")
  end
end
