class AddRssColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :rss_url, :text
  end
end
