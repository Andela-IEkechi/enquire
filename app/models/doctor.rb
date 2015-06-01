class Doctor < ActiveRecord::Base
  has_many :doctor_likes
  has_many :answers
  has_many :answer_likes

  mount_uploader :image, ImageUploader
  validate :image_size_validation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
