class RemoveDatesFromListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :dates
  end
end
