class User < ActiveRecord::Base
  has_many :questions
  has_many :answer_likes
  has_many :doctor_likes
  has_many :hospital_likes
  has_many :reviews
  has_many :hospitals, through: :hospital_likes, class_name: 'Hospital'

  mount_uploader :image, ImageUploader
  validate :image_size_validation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]


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
