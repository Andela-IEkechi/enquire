class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :article, index: true
      t.references :user, index: true
      t.integer :score, null: false, default: 0

      t.timestamps null: false
    end
    add_foreign_key :ratings, :articles
    add_foreign_key :ratings, :users
  end
end
