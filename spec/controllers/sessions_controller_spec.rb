require 'rails_helper'

RSpec.describe 'Sessions Controller', type: :feature do
  before :each do
    user = User.initialize_with_images(username: 'kubi', fullname: 'kc')
    user.save
    visit '/'
    fill_in 'user[username]', with: 'kubi'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'signs in successfully' do
      expect(page).to have_content('kubi')
    end

    it 'signs out successfully' do
      click_link 'SIGN OUT'
      expect(page).not_to have_content('kubi')
    end
  end
end
