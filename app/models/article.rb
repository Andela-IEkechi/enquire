class Article < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  scope :contains_text, -> (text) { where("title like ? OR content like ?", "%#{text}%", "%#{text}%")}

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end
