class Answer < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :question
end
