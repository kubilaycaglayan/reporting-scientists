class User < ApplicationRecord
  # validations
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :fullname, length: { maximum: 50 }

  # associations
  has_many :following_followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followings, source: :following, through: :following_followings

  has_many :following_followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, source: :follower, through: :following_followers

  has_many :opinions, foreign_key: 'author_id'

  has_many :photos, inverse_of: :user
  accepts_nested_attributes_for :photos

  # methods
  def follow(user)
    Following.create(follower_id: id, followed_id: user.id)
  end

  def unfollow(user)
    Following.where(follower_id: id, followed_id: user.id).first.destroy
  end

  def following?(user)
    !Following.where(follower_id: id, followed_id: user.id).empty?
  end

  def visible_opinions
    Opinion.where(id: followings.ids)
  end
end
