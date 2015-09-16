class Follow < ActiveRecord::Base
  belongs_to :user #todo what type of user will be able to follow a question?
  belongs_to :question

  validates_presence_of :user, :question
  validates :user, uniqueness: {scope: :question}
end
