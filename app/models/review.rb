class Review < ActiveRecord::Base
  belongs_to :hospital, -> { where(verified: true) }
  belongs_to :user, -> { where(role: "user") }

  validates :hospital, :user, :content, presence: true
  validate :hospital_is_verified, :user_is_a_client

  def user_is_a_client
    errors.add(:user, "must be a client to give review") unless self.user and self.user.role == 'user'
  end

  def hospital_is_verified
    errors.add(:hospital, 'must be verified before it can be reviewed') unless self.hospital and self.hospital.verified == true
  end
end
