class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subject
      t.text :body
      t.integer :replies
      t.integer :views
      t.references :user

      t.timestamps
    end
  end
end
