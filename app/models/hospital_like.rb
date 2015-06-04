class HospitalLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :hospital
end
