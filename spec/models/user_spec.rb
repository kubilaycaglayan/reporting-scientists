require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'kubi', fullname: 'kubilay caglayan') }
  let(:user2) { User.new(username: 'kubi', fullname: 'kubilay caglayan') }

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
      user = User.initialize_with_images(user)
      expect(user.cover_images.first.image_file_name).not_to be_nil
    end

    it 'initializes an object with a profile image' do
      user = User.initialize_with_images(user)
      expect(user.profile_images.first.image_file_name).not_to be_nil
    end
  end
end
