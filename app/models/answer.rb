class Answer < ActiveRecord::Base
  belongs_to :user, -> { where(doctor: true) }
  belongs_to :question

  has_many :answer_likes
end
