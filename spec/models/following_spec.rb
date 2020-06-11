require 'rails_helper'
require 'byebug'

RSpec.describe Following, type: :model do
  let(:user) { User.create(username: 'kubi', fullname: 'kubilay caglayan') }
  let(:user2) { User.create(username: 'mari', fullname: 'marios kanellopoulos') }
  let(:follow) { Following.create(follower_id: user.id, followed_id: user2.id) }
  let(:follow2) { Following.create(follower_id: user.id, followed_id: user2.id) }

  describe 'associations' do
    it 'belongs_to a follower' do
      expect(follow).to respond_to(:follower)
    end

    it 'belongs_to a following' do
      expect(follow).to respond_to(:following)
    end
  end

  describe 'database level uniqueness check' do
    it 'is not allowed to create two identical records' do
      follow
      expect { follow2 }.to raise_error
    end
  end
end
