require 'rails_helper'

RSpec.describe "contents/show", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
