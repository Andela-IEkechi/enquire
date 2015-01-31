class CreateAnswerLikes < ActiveRecord::Migration
  def change
    create_table :answer_likes do |t|
      t.references :user, index: true
      t.references :answer, index: true

      t.timestamps null: false
    end
    add_foreign_key :answer_likes, :users
    add_foreign_key :answer_likes, :answers
  end
end
