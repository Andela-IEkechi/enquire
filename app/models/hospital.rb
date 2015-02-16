class Hospital < ActiveRecord::Base
  has_many :hospital_likes
  has_many :users, through: :hospital_likes, class_name: 'User'

  has_attached_file :image, styles: { large: "650x700>",
                                         medium: "300x300>",
                                         thumb: "100x100>" },
                    storage: :s3,
                    bucket: 'andela-ratsi',
                    s3_credentials: {
                        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment_content_type :image, content_type: /^image\/(png|jpeg)/,
                                    message: 'only (png/jpeg) images'

  validates_attachment :image, size: { in: 0..10.megabytes }

  HOSPITAL_TYPE = ["General", "Specialist", "Psychiatric",
                   "Fertility", "Eye Clinic", "Dental Clinic" ,
                   "Nursing Homes", "Rehabs",  "Ambulance care center"]
end
