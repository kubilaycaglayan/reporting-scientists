require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user) { User.create(username: 'kubi', fullname: 'kubilay caglayan')}
  let(:opinion) { Opinion.new(text: 'Hi', author_id: user.id) }

  describe 'validations' do
    it 'checks text to be less than 140 chars' do
      opinion.text = 'a' * 141
      expect(opinion).not_to be_valid
    end

    it 'checks presence of text' do
      opinion.text = nil
      expect(opinion).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(opinion).to respond_to(:user)
    end

    it 'has many comments' do
      expect(opinion).to respond_to(:comments)
    end
  end
end
