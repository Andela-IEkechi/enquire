class AnswerLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :answer

  validates :user, uniqueness: {scope: :answer_id}
  validates_presence_of :answer, :user

  validate :is_a_client

  def is_a_client
    errors.add(:user, "must be a verified doctor") unless self.user && self.user.role == "user"
  end

end
