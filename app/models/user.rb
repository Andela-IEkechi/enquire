class User < ActiveRecord::Base
  has_many :questions
  has_many :answer_likes
  has_many :doctor_likes
  has_many :hospital_likes
  has_many :hospitals
  has_many :reviews
  has_many :likes, through: :hospital_likes, class_name: 'Hospital'
  has_many :follows
  has_one :doctor_verification_request
  has_many :questions, through: :follows, class_name: 'Question'
  has_many :answers
  # belongs_to :hospital, through: :doctor_lists, class_name: "Hospital" todo CHECK
  belongs_to :hospital

  scope :is_doctor, -> { where(role: 'doctor') }
  scope :client, -> { where(role: 'user') }
  scope :manager, -> { where(role: 'manager') }

  mount_uploader :image, ImageUploader
  validate :image_size_validation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  SPECIALIZATION = ["Medicine", "Surgery", "Obstetrics & Gynaecology", "Paediatrics", "Pathology (Morbid Anatomy, Chemical Pathology, Haematology/Immunology and Microbiology)",
                    "Otorhinolaryngology (ENT)", "Radiation Medicine", "Radiotherapy", "Ophthalmology", "Community Medicine", "Anaesthesia", "Psychiatry",
                    "Dentistry (Restorative. Preventive, Dental Child Health and Maxiliofacial)"]

  GENDER = ["Male", "Female"]
  RELIGION = ["Christianity", "Islam", "Chrislam", "The Grail Movement", "The Reformed Ogboni Fraternity", "Non-Religious", "Other"]
  TRIBE = ["Igbo", "Hausa/Fulani", "Yoruba"]
  MARITAL = ["Single", "Married", "Widowed", "Divorced", "Cohabiting", "Civil Union", "Domestic Partnership", "Unmarried Partners" ]
  ROLE = ["user", "doctor", "manager"]

  private

  def self.find_for_facebook(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
            name: data["name"],
            provider: access_token.provider,
            email: data["email"],
            image: data["image"],
            uid: access_token.uid,
            password: Devise.friendly_token[0, 20],
        )
      end
    end
  end

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

end
