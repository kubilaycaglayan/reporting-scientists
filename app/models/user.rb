class User < ApplicationRecord
  # validations

  # associations

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'

  has_many :opinions

  has_many :photos, inverse_of: :user
  accepts_nested_attributes_for :photos

  # methods
end
