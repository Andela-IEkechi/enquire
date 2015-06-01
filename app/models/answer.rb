class Answer < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :question

  has_many :answer_likes
end
