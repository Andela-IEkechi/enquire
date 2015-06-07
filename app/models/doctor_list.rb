class DoctorList < ActiveRecord::Base
  has_many :user
  has_many :hospitals
end
