class Article < ActiveRecord::Base
  belongs_to :doctor, -> { where(role: "doctor", verified: true) }, class_name: "User", foreign_key: 'user_id'
  has_many :ratings, dependent: :destroy

  scope :contains_text, -> (text) { where("title like ? OR content like ?", "%#{text}%", "%#{text}%")}

  validates :doctor, :title, :content, presence: true
  validate :doc_is_a_verified_doctor

  def average_rating
    self.ratings.sum(:score) / self.ratings.size
  end

  def doc_is_a_verified_doctor
    errors.add(:user, "must be a doctor") unless self.doctor and self.doctor.role == "doctor" and self.doctor.verified == true
  end
end
