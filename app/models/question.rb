class Question < ActiveRecord::Base
  belongs_to :user, -> { where(role: "user") }
  has_many :answers, :dependent => :destroy
  has_many :follows
  has_many :users, through: :follows, class_name: 'User'
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :body, :user

  accepts_nested_attributes_for :answers

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name(name.strip.split(',')).try(:questions)
  end
end
