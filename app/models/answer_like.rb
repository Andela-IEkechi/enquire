class AnswerLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates_uniqueness_of :user_id
end
