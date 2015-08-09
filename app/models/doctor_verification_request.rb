class DoctorVerificationRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :message, :user, :hospital, presence: true
  validates :user_id, uniqueness: { message: "You already have a verification request open!" }
  validate :eligible?

  before_destroy :update_doctor

  protected

    def eligible?
      errors[:base] << "Not a doctor, or Already verified" unless self.user.role == 'doctor' and self.user.verified == false
    end

    def update_doctor
      logger.info('got here '*10)
      ActiveRecord::Base.transaction do
        if self.user.update_attribute(:verified, true) and self.user.update_attribute(:hospital, self.hospital)
          logger.info("UPDATED"*30)
        else
          logger.info("FAILED"*20)
        end
        DoctorList.create!(user_id: user.id, hospital_id: hospital.id)
      end
    end
end
