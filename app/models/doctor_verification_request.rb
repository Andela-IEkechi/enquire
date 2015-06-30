class DoctorVerificationRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :message, :user, :hospital, presence: true
  validates :user_id, uniqueness: { message: "You already have a verification request open!" }
  validate :eligible?

  after_commit :update_doctor, on: :destroy

  protected

  def eligible?
    errors[:base] << "Not a doctor, or Already verified" unless self.user.role == 'doctor' and self.user.verified == false
  end

  def update_doctor
    ActiveRecord::Base.transaction do
      user.verified = true
      user.hospital = hospital
      user.save
      DoctorList.create!(user_id: user.id, hospital_id: hospital.id)
    end
  end
end
