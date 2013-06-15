class MicropostContentTostring < ActiveRecord::Migration
  def up
  	remove_column :microposts, :content
  	add_column :microposts, :content, :text 
  end
end
