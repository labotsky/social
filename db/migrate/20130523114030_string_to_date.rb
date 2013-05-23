class StringToDate < ActiveRecord::Migration
  def up
  	remove_column :users, :date
  	add_column :users, :date, :date
  end

  def down
  end
end
