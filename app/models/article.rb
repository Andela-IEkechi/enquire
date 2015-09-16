class Article < ActiveRecord::Base
  belongs_to :writer, -> { where(role: "doctor") }, class_name: "User", foreign_key: 'user_id'
  has_many :ratings, dependent: :destroy

  scope :contains_text, -> (text) { where("title like ? OR content like ?", "%#{text}%", "%#{text}%")}

  validates :writer, :title, :content, presence: true
  validate :doc_is_a_verified_doctor

  def average_rating
    self.ratings.sum(:score) / self.ratings.size
  end

  def user_rating(user = current_user)
    Rating.find_by(article: self, user: user) || Rating.create(article: self, user: user, score: 0)
  end

  def doc_is_a_verified_doctor
    errors.add(:writer, "must be a verified doctor") unless self.writer and self.writer.role == "doctor" and self.writer.verified == true
  end
end
