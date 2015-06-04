class AnswerLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :answer
end
