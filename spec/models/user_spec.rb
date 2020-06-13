require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'kubi', fullname: 'kubilay caglayan') }
  let(:user2) { User.new(username: 'kubi', fullname: 'kubilay caglayan') }
  let(:user3) { User.new(username: 'mari', fullname: 'marios kanellopoulos') }
  let(:user4) { User.new(username: 'vera', fullname: 'vera caglayan') }

  describe 'validations' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'requires username to be valid' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'is not valid if username is more than 50 chars' do
      user.username = 'a' * 51
      expect(user).not_to be_valid
    end

    it 'is not valid if fullname is more than 50 chars' do
      user.fullname = 'a' * 51
      expect(user).not_to be_valid
    end

    it 'checks unique constraint on username' do
      user.save
      expect(user2).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many followings' do
      expect(user).to respond_to(:followings)
    end

    it 'has many followers' do
      expect(user).to respond_to(:followers)
    end

    it 'has many opinions' do
      expect(user).to respond_to(:opinions)
    end

    it 'has many cover_images' do
      expect(user).to respond_to(:cover_images)
    end

    it 'has many profile_images' do
      expect(user).to respond_to(:profile_images)
    end

    it 'has many comments' do
      expect(user).to respond_to(:comments)
    end
  end

  describe 'class methods' do
    it 'initializes an object with a cover image' do
      user_w = User.initialize_with_images({ username: 'kubi', fullname: 'kc' })
      expect(user_w.cover_images.first.image_file_name).not_to be_nil
    end

    it 'initializes an object with a profile image' do
      user_w = User.initialize_with_images({ username: 'kubi', fullname: 'kc' })
      expect(user_w.profile_images.first.image_file_name).not_to be_nil
    end
  end

  describe 'instance methods' do
    let(:user) { User.create(username: 'kubi', fullname: 'kubilay caglayan') }
    let(:user2) { User.create(username: 'mari', fullname: 'marios kanellopoulos') }
    let(:user3) { User.create(username: 'vera', fullname: 'vera caglayan') }
    let(:follow) { Following.create(follower_id: user.id, followed_id: user3.id) }
    let(:follow2) { Following.create(follower_id: user2.id, followed_id: user3.id) }
    let(:follow3) { Following.create(follower_id: user.id, followed_id: user2.id) }

    it 'follows a user' do
      follow
      expect(user.following?(user3)).to be true
    end

    it 'unfollows a user' do
      follow
      user.unfollow(user3)
      expect(user.following?(user3)).to be false
    end

    it 'returns true if the user following the other given user' do
      follow
      expect(user.following?(user3)).to be true
    end

    it 'returns the visible opinions' do
      follow
      user3.opinions.create(text: 'hi')
      expect(user.visible_opinions).to eq(user3.opinions)
    end

    it 'returns users not followed by the user' do
      follow
      user2
      expect(user.unfollowings).to eq([user2])
    end

    it 'returns true if profile image exists' do
      expect(user.profile_image?).not_to be true
    end

    it 'returns true if cover image exists' do
      expect(user.cover_image?).not_to be true
    end

    it 'returns an object that is following the user' do
      follow2
      follow3
      expect(user.followed_by(user3)).to eq(user2)
    end
  end
end
