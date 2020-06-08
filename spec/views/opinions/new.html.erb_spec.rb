require 'rails_helper'

RSpec.describe 'opinions/new', type: :view do
  before(:each) do
    assign(:opinion, Opinion.new(
                       author_id: 1,
                       text: 'MyText'
                     ))
  end

  it 'renders new opinion form' do
    render

    assert_select 'form[action=?][method=?]', opinions_path, 'post' do
      assert_select 'input[name=?]', 'opinion[author_id]'

      assert_select 'textarea[name=?]', 'opinion[text]'
    end
  end
end
