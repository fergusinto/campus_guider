class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.integer :user_id, :null => false
      t.integer :store_id, :null => false
      t.text :content
    end
  end
end
