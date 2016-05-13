class AddDatesToListings < ActiveRecord::Migration
  def change
  		change_table :listings do |t|
      	t.date :dates, array: true, default: []
  		end
  end
end
