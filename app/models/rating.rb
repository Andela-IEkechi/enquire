class Rating < ActiveRecord::Base
  belongs_to :article
  belongs_to :user #todo what type of user can rate an article? client or doctor?

  before_save :update_rating_if_already_exists, if: :new_record?

  validates :article, :user, :score, presence: true
  # validates :user, uniqueness: { scope: :article, message: "have already rated this article" }#todo users should be able to override their previous ratings

  def update_rating_if_already_exists
    original_rating = Rating.where(user: self.user, article: self.article)
    if original_rating.blank?
      true
    else
      original_rating[0].update_attribute(:score, self.score)
      false
    end
  end

  # todo how could we make this more scalable?
  # def self.rate
  #   original_rating = Rating.where(user: self.user, article: self.article)
  #   if original_rating.blank?
  #     self.save
  #   else
  #     original_rating[0].update_attribute(:score, self.score)
  #   end
  # end
end
