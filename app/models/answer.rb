class Answer < ActiveRecord::Base
  belongs_to :user, -> { where(role: "doctor", verified: true) }
  belongs_to :question

  has_many :answer_likes, :dependent => :destroy

  validates_presence_of :content, :question, :user
end
