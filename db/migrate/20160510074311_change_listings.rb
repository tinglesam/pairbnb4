class ChangeListings < ActiveRecord::Migration
   def change
    remove_column :listings, :dates
  end
end
