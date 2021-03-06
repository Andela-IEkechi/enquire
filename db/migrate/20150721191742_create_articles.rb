class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true
      t.text :title
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :articles, :users
  end
end
