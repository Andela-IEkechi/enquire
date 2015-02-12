class DoctorLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor

  validates_uniqueness_of :user_id
end
