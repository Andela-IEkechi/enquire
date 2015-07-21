class Article < ActiveRecord::Base
  belongs_to :user

  scope :contains_text, -> (text) { where("title like ? OR content like ?", "%#{text}%", "%#{text}%")}
end
