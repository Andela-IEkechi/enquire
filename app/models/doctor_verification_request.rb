class DoctorVerificationRequest < ActiveRecord::Base
  belongs_to :user, -> { where(role: 'doctor') }
  belongs_to :hospital, -> { where(verified: true) }

  validates :message, :user, :hospital, presence: true
  validates :user, uniqueness: { message: "You already have a verification request open!" }
  validate :user_eligible?, :hospital_eligible?

  before_destroy :update_doctor

  protected

  def user_eligible?
    errors.add(:user, "Not a doctor, or Already verified") unless self.user && self.user.role == 'doctor' and self.user.verified == false
  end

  def hospital_eligible?
    errors.add(:hospital, "must be verified") unless self.hospital and self.hospital.verified == true
  end

  def update_doctor
    ActiveRecord::Base.transaction do
      self.user.update_attributes(verified: true, hospital: self.hospital)
      DoctorList.create!(user_id: user.id, hospital_id: hospital.id)
    end
  end
end
