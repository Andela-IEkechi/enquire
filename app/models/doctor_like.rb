class DoctorLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :user, -> { where(doctor: true) }
end
