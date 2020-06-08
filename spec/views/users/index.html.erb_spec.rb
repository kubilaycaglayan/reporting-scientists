require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               username: 'Username',
               fullname: 'Fullname',
               photo: 'Photo',
               coverimage: 'Coverimage'
             ),
             User.create!(
               username: 'Username',
               fullname: 'Fullname',
               photo: 'Photo',
               coverimage: 'Coverimage'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Username'.to_s, count: 2
    assert_select 'tr>td', text: 'Fullname'.to_s, count: 2
    assert_select 'tr>td', text: 'Photo'.to_s, count: 2
    assert_select 'tr>td', text: 'Coverimage'.to_s, count: 2
  end
end
