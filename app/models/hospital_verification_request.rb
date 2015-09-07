class HospitalVerificationRequest < ActiveRecord::Base
  belongs_to :user #todo :manager, -> { where(role: "manager") }, class_name: "User", foreign_key: 'user_id'
  belongs_to :hospital

  validates :message, :user, :hospital, presence: true
  validates :hospital, uniqueness: { message: "already has a verification request open!" }
  validate :hospital_eligible?, :user_eligible?

  after_destroy :verify_hospital

  protected

    def user_eligible?
      errors.add(:user, "must be a manager") unless self.user and self.user.role == 'manager'
    end

    def hospital_eligible?
      errors.add(:hospital, "is already verified") unless self.hospital and self.hospital.verified == false
    end

    def verify_hospital
      ActiveRecord::Base.transaction do
        self.hospital.update_attributes(verified: true)
        HospitalList.create!(user_id: user.id, hospital_id: hospital.id)
      end
    end
end
