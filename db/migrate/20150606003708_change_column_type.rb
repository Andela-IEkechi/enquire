class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :profiles, :phone_number, :string
  end
end
