class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :image_url, :text
  end
end
