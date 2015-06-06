class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :address, :text
    add_column :users, :phone_number, :string
    add_column :users, :ethnicity, :string
    add_column :users, :occupation, :string
    add_column :users, :religion, :string
    add_column :users, :marital_status, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :year_of_grad, :string
    add_column :users, :specialization, :string
  end
end
