require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :title => "Title"
      ),
      Content.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
