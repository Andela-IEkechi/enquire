class Doctor < ActiveRecord::Base
  has_many :doctor_likes
  has_many :answers
  has_many :answer_likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { large: "650x700>",
                                      medium: "300x300>",
                                      thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /^image\/(png|jpeg)/,
                                    message: 'only (png/jpeg) images'

  validates_attachment :image, presence: true,
                       size: { in: 0..5.megabytes }

end
