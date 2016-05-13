class AddTotalCostToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :totalcost, :integer
  end
end
