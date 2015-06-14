class AddInterestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interests, :string, default: ""
  end
end
