class Hospital < ActiveRecord::Base
  require 'paperclip'
  
  has_many :hospital_likes
  has_many :users, through: :hospital_likes, class_name: 'User'

  has_attached_file :image, :styles => { :large => "650x700>",
                                         :medium => "300x300>",
                                         :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_attachment :image, :presence => true,
                       :content_type => { :content_type => "image/jpeg" },
                       :size => { :in => 0..10.megabytes }


  HOSPITAL_TYPE = ["General", "Specialist", "Psychiatric",
                   "Fertility", "Eye Clinic", "Dental Clinic" ,
                   "Nursing Homes", "Rehabs",  "Ambulance care center"]
end
