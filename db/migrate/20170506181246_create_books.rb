class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :book_name
      t.string :display_name

      t.timestamps null: false
    end
  end
end
