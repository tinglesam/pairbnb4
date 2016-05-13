class RemoveDateAvailibleFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :days__availible, :string
  end


  
end
