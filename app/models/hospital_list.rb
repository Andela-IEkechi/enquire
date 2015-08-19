class HospitalList < ActiveRecord::Base
  belongs_to :user #todo :manager, -> { where(role: "manager") }, class_name: "User", foreign_key: 'user_id'
  belongs_to :hospital

  validates :hospital, uniqueness: { message: "You have already been verified!" }
  validates :user, :hospital, presence: true


  after_destroy :unverify_hospital

  protected

  def unverify_hospital
    self.hospital.update_attribute(:verified, false)
  end
end
