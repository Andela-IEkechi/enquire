class Question < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :user, -> { where(role: "doctor") }
  has_many :answers
  has_many :follows
  has_many :users, through: :follows, class_name: 'User'

end
