require 'rails_helper'

RSpec.describe Content, type: :model do
  
  it "sanitizes the video url" do
    closer = Content.create!(title: "title 1", video_url: "https://www.youtube.com/watch?v=PT2_F-1esPk")
    expect(closer.sanitize_video_url).to eq("PT2_F-1esPk")
  end

  it "sanitizes the image url" do
    image = Content.create!(title: "title 1", image_url: "cdn.caredox.com/assets/caredoxshare.svg")
    expect(image.sanitize_image_url).to eq("http://cdn.caredox.com/assets/caredoxshare.svg")
  end

end
