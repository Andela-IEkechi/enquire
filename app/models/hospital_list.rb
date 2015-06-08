class HospitalList < ActiveRecord::Base
  has_many :users
  has_many :hospitals
end
