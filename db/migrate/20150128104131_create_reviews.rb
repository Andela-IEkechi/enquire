class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :hospital, index: true
      t.references :user, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :reviews, :hospitals
    add_foreign_key :reviews, :users
  end
end
