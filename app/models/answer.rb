class Answer < ActiveRecord::Base
  belongs_to :user, -> { where(role: "doctor") }
  belongs_to :question

  has_many :answer_likes, :dependent => :destroy

  validates_presence_of :content, :question, :user
  validate :doctor_is_verified

  def doctor_is_verified
    errors.add(:user, "must be a verified doctor") unless self.user && self.user.role == "doctor" && self.user.verified == true
  end
end
