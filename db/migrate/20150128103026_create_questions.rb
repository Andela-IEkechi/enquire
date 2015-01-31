class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :caption
      t.text :body
      t.references :user, index: true
      t.references :doctor, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :users
    add_foreign_key :questions, :doctors
  end
end
