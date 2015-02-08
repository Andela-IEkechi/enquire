class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor
  has_many :answers
end
