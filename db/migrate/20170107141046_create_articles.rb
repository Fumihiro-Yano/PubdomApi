class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :status, default: 0, limit: 1
      t.integer :created_user_id

      t.timestamps
    end
  end
end
