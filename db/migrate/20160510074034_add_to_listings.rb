class AddToListings < ActiveRecord::Migration
  def change
  	change_table :listings do |t|
      	t.date :start_date, null:false
      	t.date :end_date, null:false
  		end

  end
end
