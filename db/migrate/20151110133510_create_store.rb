class CreateStore < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.float :longitude
      t.float :lantitude
    end
  end
end
