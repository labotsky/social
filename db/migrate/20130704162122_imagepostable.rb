class Imagepostable < ActiveRecord::Migration
  def up
  	remove_column :imageposts, :micropost_id
  	add_column :imageposts, :imagepostable_id, :integer
  	add_column :imageposts, :imagepostable_type, :string
  end

  def down
  	add_column :imageposts, :micropost_id, :integer
  	remove_column :imageposts, :imagepostable_id
  	remove_column :imageposts, :imagepostable_type
  end
end
