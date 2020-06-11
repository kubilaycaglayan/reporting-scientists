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
    it 'shows all the users' do
      click_link 'SCIENTISTS'
      expect(page).to have_content('kubi')
      expect(page).to have_content('vera')
    end

    it 'shows user page' do
      click_link 'vera'
      expect(page).to have_content('vc')
    end

    it 'shows a create new user page' do
      click_link 'NEW SCIENTIST'
      expect(page).to have_button('Create User and Sign In')
    end

    it 'shows an edit page' do
      click_link 'PROFILE'
      click_link 'Edit'
      expect(page).to have_button('Save Changes')
    end

    it 'creates a new user' do
      click_link 'NEW SCIENTIST'
      fill_in 'user[username]', with: 'new user'
      fill_in 'user[fullname]', with: 'definitely'
      click_button 'Create User and Sign In'
      expect(page).to have_content('new user')
    end

    it 'updates user preferences' do
      click_link 'PROFILE'
      click_link 'Edit'
      fill_in 'user[username]', with: 'great'
      click_button 'Save Changes'
      expect(page).to have_content('great')
    end
  end
end
