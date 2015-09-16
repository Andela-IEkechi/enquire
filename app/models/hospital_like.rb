class HospitalLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :hospital

  validates :user, :hospital, :presence => true
  validates :user, uniqueness: {scope: :hospital}
  validate :is_a_client

  def is_a_client
    errors.add(:user, "must be a client") unless self.user and self.user.role == "user"
  end
end
