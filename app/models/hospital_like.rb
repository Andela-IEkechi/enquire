class HospitalLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :hospital

  validates_uniqueness_of :user_id
end
