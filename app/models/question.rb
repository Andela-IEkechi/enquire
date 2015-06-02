class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor
  has_many :answers
  has_many :follows
  has_many :users, through: :follows, class_name: 'User'
end
