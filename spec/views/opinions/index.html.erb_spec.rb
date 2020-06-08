require 'rails_helper'

RSpec.describe 'opinions/index', type: :view do
  before(:each) do
    assign(:opinions, [
             Opinion.create!(
               author_id: 2,
               text: 'MyText'
             ),
             Opinion.create!(
               author_id: 2,
               text: 'MyText'
             )
           ])
  end

  it 'renders a list of opinions' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
