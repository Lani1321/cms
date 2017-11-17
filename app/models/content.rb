class Content < ApplicationRecord
  before_create :destroy_old_title
  validates :title, presence: true, on: :create

  # Destroy record so there's always just one in db
  def destroy_old_title
    Content.first.destroy if Content.count >= 1
  end

  # Sanitize url to pass in the right url to embed youtube video
  def sanitize_video_url
    if self.video_url
      self.video_url = self.video_url.split('/').last 
      if self.video_url.include? "watch?v="
        self.video_url = self.video_url.split('=').last
      end
    end
  end

  # Sanitize image urls that dont have http preceeding
  # Images folder gets prepended if there is no http 
  # i.e. 'images/cdn.caredox.com/assets/caredoxshare.svg'
  def sanitize_image_url
    if self.image_url 
      if self.image_url.first != "h"
        self.image_url = "http://#{self.image_url}"
      end
    end
  end
end
