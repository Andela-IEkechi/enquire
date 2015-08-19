class HospitalVerificationRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :message, :user, :hospital, presence: true
  validates :hospital_id, uniqueness: { message: "already has a verification request open!" }
  validate :eligible?

  after_commit :update_hospital, on: :destroy

  protected

    def eligible?
      errors[:base] << "Already verified" unless self.hospital.verified == false
    end

    def update_hospital
      ActiveRecord::Base.transaction do
        self.hospital.update_attributes(verified: true)
        HospitalList.create!(user_id: user.id, hospital_id: hospital.id)
      end
    end
end
