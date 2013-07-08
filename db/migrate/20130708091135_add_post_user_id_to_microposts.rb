class AddPostUserIdToMicroposts < ActiveRecord::Migration
  def change
  	add_column :microposts, :post_user_id, :integer
  end
end
