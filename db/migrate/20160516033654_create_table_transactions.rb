class CreateTableTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :reservation_id
      t.timestamps null: false
    end
  end
end
