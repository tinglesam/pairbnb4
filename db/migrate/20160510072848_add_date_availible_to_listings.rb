class AddDateAvailibleToListings < ActiveRecord::Migration
  def change
  		change_table :listings do |t|
      	t.string :dates, array: true, default: []
  		end
  end
end
