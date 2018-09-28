class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :text
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
