class DoctorLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  # belongs_to :user, -> { where(doctor: true) } #todo what is this?
  # belongs_to :doctor,  -> { where(role: 'doctor', verified: true) }, class_name: "User", foreign_key: 'user_id' #todo why is a like not linked to a doctor? NOT ATALL CLEAR

  validates_presence_of :user
  validate :is_a_client#, :doctor_is_verified

  def is_a_client
    errors.add(:user, "must be a regular client") unless self.user && self.user.role == "user"
  end

  def doctor_is_verified
    errors.add(:doctor, "must be verified") unless self.doctor && self.doctor.role == "doctor" && self.doctor.verified == true
  end
end
