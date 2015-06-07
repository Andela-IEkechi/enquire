class CreateHospitalVerificationRequests < ActiveRecord::Migration
  def change
    create_table :hospital_verification_requests do |t|
      t.references :user, index: true
      t.references :hospital, index: true
      t.text :message

      t.timestamps null: false
    end
    add_foreign_key :hospital_verification_requests, :users
    add_foreign_key :hospital_verification_requests, :hospitals
  end
end
