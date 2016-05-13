class ChangeDatesToListings < ActiveRecord::Migration
  def change

  	def change
  		remove_column :listings, :dates
  		
  		change_table :listings do |t|
      	t.string :dates, array: true, default: []
  		end
  end
  end
end
