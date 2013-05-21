class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :country
      t.string :sity
      t.string :date

      t.timestamps
    end
  end
end
