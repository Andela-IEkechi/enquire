class Doctor < ActiveRecord::Base
  has_many :doctor_likes
  has_many :answers
  has_many :answer_likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
