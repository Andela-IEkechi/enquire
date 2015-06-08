class DoctorList < ActiveRecord::Base
  has_many :users
  has_many :hospitals

  after_commit :remove_doctor, on: :destroy

  protected

  def remove_doctor
    user.verified = false
    user.save
  end
end
