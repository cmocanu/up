class Comment < ActiveRecord::Base
  attr_accessible :user_id, :content, :karma, :post_id
  acts_as_votable

  validates :user_id, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :post

  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", foreign_key: "parent_id"
end