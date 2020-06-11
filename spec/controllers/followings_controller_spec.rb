require 'rails_helper'

RSpec.describe 'Sessions Controller', type: :feature do
  before :each do
    user = User.initialize_with_images(username: 'kubi', fullname: 'kc')
    user.save

    user2 = User.initialize_with_images(username: 'vera', fullname: 'vc')
    user2.save

    visit '/'
    fill_in 'user[username]', with: 'kubi'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'follows a user' do
      click_link 'vera'
      click_link 'Follow'
      expect(page).to have_content('Unfollow')
    end

    it 'unfollows a user' do
      click_link 'vera'
      click_link 'Follow'
      click_link 'Unollow'
      expect(page).to have_content('Follow')
    end
  end
end
