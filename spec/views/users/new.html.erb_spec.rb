require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    username: 'MyString',
                    fullname: 'MyString',
                    photo: 'MyString',
                    coverimage: 'MyString'
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[username]'

      assert_select 'input[name=?]', 'user[fullname]'

      assert_select 'input[name=?]', 'user[photo]'

      assert_select 'input[name=?]', 'user[coverimage]'
    end
  end
end
