require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(username: 'kubi', fullname: 'kubilay caglayan')}
  let(:opinion) { Opinion.create(text: 'Hi', author_id: user.id) }
  let(:comment) { Comment.new(user_id: user.id, opinion_id: opinion.id, content: 'Hi') }

  describe 'associations' do
    it 'belongs to a user' do
      expect(comment).to respond_to(:user)
    end

    it 'belongs to an opinion' do
      expect(comment).to respond_to(:opinion)
    end
  end

  describe 'validations' do
    it 'checks the presence of content' do
      comment.content = nil
      expect(comment).not_to be_valid
    end

    it 'checks the length of content to be less than 140 chars' do
      comment.content = 'a' * 141
      expect(comment).not_to be_valid
    end
  end
end
