require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            username: 'Username',
                            fullname: 'Fullname',
                            photo: 'Photo',
                            coverimage: 'Coverimage'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Coverimage/)
  end
end
