require 'rails_helper'

RSpec.describe 'Opinions Controller', type: :feature do
  before :each do
    user = User.initialize_with_images(username: 'kubi', fullname: 'kc')
    user.save
    user2 = User.initialize_with_images(username: 'vera', fullname: 'vc')
    user2.save
    opinion = Opinion.new(text: 'My report', author_id: user.id)
    opinion.save
    opinion2 = Opinion.new(text: 'My report2', author_id: user2.id)
    opinion2.save
    user.follow(user2)
    visit '/'
    fill_in 'user[username]', with: 'kubi'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'shows all the opinions in the main page' do
      expect(page).to have_content('My report')
      expect(page).to have_content('My report2')
    end

    it 'creates opinion' do
      fill_in 'opinion[text]', with: 'My report3'
      click_button 'Report'
      expect(page).to have_content('Report created successfully.')
      expect(page).to have_content('My report3')
    end
  end
end
