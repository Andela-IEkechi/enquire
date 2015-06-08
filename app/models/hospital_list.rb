class HospitalList < ActiveRecord::Base
  has_many :users
  has_many :hospitals

  after_commit :remove_hospital, on: :destroy

  protected

  def remove_hospital
    hospital.verified = false
    hospital.save
  end
end
