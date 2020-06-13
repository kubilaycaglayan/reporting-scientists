require 'rails_helper'

RSpec.describe 'Followings Controller', type: :feature do
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

  describe 'actions' do
    it 'allows users to create comments' do
      expect(page).to have_button('Comment')
    end

    it 'creates comment' do
      first('#comment_content').fill_in with: 'here i go'
      first('.new_comment').click_button('Comment')
      expect(page).to have_content('Comment created.')
      expect(page).to have_content('here i go')
    end
  end
end
