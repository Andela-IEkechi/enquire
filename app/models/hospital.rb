class Hospital < ActiveRecord::Base
  has_many :hospital_likes
  has_many :users, through: :hospital_likes, class_name: 'User'
  mount_uploader :image, ImageUploader #can or can't we test this?
  has_many :doctors, class_name: "DoctorList"
  belongs_to :manager, -> { where(role: "manager") }, class_name: "User", foreign_key: 'user_id'

  validates :image, :name, :address, :classification, :manager, presence: true
  validate :image_size_validation, :user_is_manager
  has_one :hospital_verification_request

  scope :verified, -> { where(verified: true) }

  HOSPITAL_TYPE = ["General", "Specialist", "Psychiatric",
                   "Fertility", "Eye Clinic", "Dental Clinic" ,
                   "Nursing Homes", "Rehabs",  "Ambulance care center"]

  private

  def user_is_manager
    errors.add(:manager, "must be a manager") unless self.manager && self.manager.role == "manager"
  end

  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end
end
