class AddStatusToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :is_published_flag, :boolean, default: false
  end
end
