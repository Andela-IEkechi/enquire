class DoctorVerificationRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :message, presence: true
  validates :user_id, uniqueness: true, message: "You already have a verification request open!"

  after_commit :update_doctor, on: :destroy

  protected

  def update_doctor
    user.verified = true
    user.save
  end
end
