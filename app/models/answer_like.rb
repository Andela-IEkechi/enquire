class AnswerLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :answer

  validates :user_id, uniqueness: {scope: :answer_id}
end
