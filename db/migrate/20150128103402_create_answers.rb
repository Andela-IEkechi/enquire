class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :doctor, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :doctors
    add_foreign_key :answers, :questions
  end
end
