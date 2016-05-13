class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.integer :people, null: false
      t.date :days__availible, null:false
      t.string :address, null: false
      t.string :amenities, null: false
      t.timestamps null: false
    end
  end



  
end
