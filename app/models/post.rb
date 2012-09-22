class Post < ActiveRecord::Base
  attr_accessible :user_id, :karma, :link, :title
  acts_as_votable

  validates :link, presence: true, on: :create
  validates :title, presence: true, length: { maximum: 50 }, on: :create
  validates :user_id, presence: true, on: :create

  belongs_to :user
  has_many :comments
end
