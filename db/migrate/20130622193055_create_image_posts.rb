class CreateImagePosts < ActiveRecord::Migration
  def change
    create_table :imageposts do |t|
    	t.integer :micropost_id    	
    	t.string :image
    	t.string :remember_token
    	t.timestamps
    end
  end
end
