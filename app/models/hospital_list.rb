class HospitalList < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :hospital_id, uniqueness: { message: "You have already been verified!" }


  after_commit :remove_hospital, on: :destroy

  protected

  def remove_hospital
    hospital.verified = false
    hospital.save
  end
end
