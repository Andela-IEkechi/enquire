class Hospital < ActiveRecord::Base
  has_many :hospital_likes
  has_many :users, through: :hospital_likes, class_name: 'User'

  has_attached_file :image, styles: { large: "650x700>",
                                         medium: "300x300>",
                                         thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /^image\/(png|jpeg)/,
                                    message: 'only (png/jpeg) images'

  validates_attachment :image, presence: true,
                       size: { in: 0..10.megabytes }

  HOSPITAL_TYPE = ["General", "Specialist", "Psychiatric",
                   "Fertility", "Eye Clinic", "Dental Clinic" ,
                   "Nursing Homes", "Rehabs",  "Ambulance care center"]
end
