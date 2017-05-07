class AddDisplayContentToBooks < ActiveRecord::Migration
  def change
    add_column :books, :display_content, :text
  end
end
