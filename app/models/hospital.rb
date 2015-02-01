class Hospital < ActiveRecord::Base
  has_many :doctors
  has_many :reviews

  HOSPITAL_TYPE = ["General", "Specialist",
                   "Psychiatric", "Fertility",
                   "Eye Clinic", "Dental Clinic",
                   "Nursing Home", "Rehab",  "Ambulance Care Center"]
end
