class DoctorList < ActiveRecord::Base
  belongs_to :user, -> { where(role: "doctor", verified: true) } #todo what about DoctorList.doctors for example?
  belongs_to :hospital

  validates_presence_of :user, :hospital
  validates :user, uniqueness: { message: "You have already been verified by a Hospital!" }
  validate :doctor_is_verified, :hospital_is_verified

  after_destroy :un_verify_doctor

  def doctor_is_verified
    errors.add(:user, "must be a verified doctor") unless self.user && self.user.role == "doctor" && self.user.verified == true
  end

  def hospital_is_verified
    errors.add(:hospital, "must be a verified") unless self.hospital && self.hospital.verified == true
  end

  protected

  def un_verify_doctor
    self.user.update_attributes(verified: false)
  end
end
