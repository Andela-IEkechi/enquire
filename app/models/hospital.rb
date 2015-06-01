class Hospital < ActiveRecord::Base
  has_many :hospital_likes
  has_many :users, through: :hospital_likes, class_name: 'User'
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validate :image_size_validation

  HOSPITAL_TYPE = ["General", "Specialist", "Psychiatric",
                   "Fertility", "Eye Clinic", "Dental Clinic" ,
                   "Nursing Homes", "Rehabs",  "Ambulance care center"]

  private

  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end
end
