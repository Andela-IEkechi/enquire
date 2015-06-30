class HospitalVerificationRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :message, :user, :hospital, presence: true
  validates :hospital_id, uniqueness: { message: "This hospital already has a verification request open!" }
  validate :eligible?

  after_commit :update_hospital, on: :destroy

  protected

    def eligible?
      errors[:base] << "Already verified" unless self.hospital.verified == false
    end

    def update_hospital
      ActiveRecord::Base.transaction do
        hospital.verified = true
        hospital.save
        HospitalList.create!(user_id: user.id, hospital_id: hospital.id)
      end
    end
end
