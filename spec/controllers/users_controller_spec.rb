require 'rails_helper'

RSpec.describe 'UserController', type: :feature do
  before :each do
    user = User.create(username: 'kubi', fullname: 'kc')
    visit '/'
    fill_in 'user[username]', with: 'kubi'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'signs in successfully' do
      expect(page).to have_content('kubi')

    end
  end

end
