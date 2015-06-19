class DoctorList < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates :user_id, uniqueness: { message: "You have already been verified by a Hospital!" }

  after_commit :remove_doctor, on: :destroy

  protected

  def remove_doctor
    ActiveRecord::Base.transaction do
      user.verified = false
      user.save
    end
  end
end
