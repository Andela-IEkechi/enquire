class User < ActiveRecord::Base
  has_many :questions
  has_many :answer_likes
  has_many :doctor_likes
  has_many :hospital_likes
  has_many :reviews
  has_many :hospitals, through: :hospital_likes, class_name: 'Hospital'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
