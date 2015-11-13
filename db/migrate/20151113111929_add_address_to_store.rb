class AddAddressToStore < ActiveRecord::Migration
  def change
    add_column :stores, :zipcode, :integer
    add_column :stores, :city, :string
    add_column :stores, :distric, :string
    add_column :stores, :address, :text
  end
end
