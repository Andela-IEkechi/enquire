class Doctor < ActiveRecord::Base
  has_many :doctor_likes
  has_many :answers
  has_many :answer_likes
  has_one :doctor_profile

  mount_uploader :image, ImageUploader
  validate :image_size_validation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  SPECIALIZATION = ["Medicine", "Surgery", "Obstetrics & Gynaecology", "Paediatrics", "Pathology (Morbid Anatomy, Chemical Pathology, Haematology/Immunology and Microbiology)",
                    "Otorhinolaryngology (ENT)", "Radiation Medicine", "Radiotherapy", "Ophthalmology", "Community Medicine", "Anaesthesia", "Psychiatry",
                    "Dentistry (Restorative. Preventive, Dental Child Health and Maxiliofacial)"]

  GENDER = ["Male", "Female"]
  RELIGION = ["Christianity", "Islam", "Chrislam", "The Grail Movement", "The Reformed Ogboni Fraternity", "Non-Religious", "Other"]
  TRIBE = ["Igbo", "Hausa/Fulani", "Yoruba"]
  MARITAL = ["Single", "Married", "Widowed", "Divorced", "Cohabiting", "Civil Union", "Domestic Partnership", "Unmarried Partners" ]

  private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
