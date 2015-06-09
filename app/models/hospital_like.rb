class HospitalLike < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  belongs_to :hospital

  validates :user_id, uniqueness: {scope: :hospital_id}
end
