require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:user) do
    User.initialize_with_images({ username: 'kubi', fullname: 'kubilay caglayan' })
  end
  let(:photo) { user.profile_images.first }

  describe 'associations' do
    it 'belongs to a user' do
      expect(photo).to respond_to(:user)
    end

    it 'has has_attached_file' do
      expect(photo).to respond_to(:image)
    end
  end

  describe 'validations' do
    it 'does not allow non image types' do
      photo_cover = Photo.new(user_id: user.id, image_type: 'cover')
      photo_cover.image = URI.parse('https://ak.picdn.net/shutterstock/videos/12243746/thumb/1.jpg')
      expect(photo_cover).not_to be_valid
    end
  end
end
