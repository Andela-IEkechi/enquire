class Answer < ActiveRecord::Base
  belongs_to :user, -> { where(role: "doctor") }
  belongs_to :question

  has_many :answer_likes, :dependent => :destroy

  validates_presence_of :content
end
