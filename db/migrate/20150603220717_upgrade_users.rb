class UpgradeUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified, :boolean, default: false
    add_column :users, :doctor, :boolean, default: false
    add_column :users, :hospital, :string
    remove_column :users, :bio, :text
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :string, default: "users"
    rename_table(:doctor_profiles, :profiles)
  end
end
