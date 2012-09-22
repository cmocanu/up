class User < ActiveRecord::Base
  attr_accessible :karma, :email, :name, :password  
  has_secure_password
  acts_as_voter

  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true, on: :create
  validates :password,  presence: true, length: { minimum: 5 }, on: :create

  has_many :comments
  has_many :posts
end
