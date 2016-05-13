class RemovePhotoFromListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :photo
  end
end
