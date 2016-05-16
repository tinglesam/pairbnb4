class ChangeColumnInReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :paid, :boolean, :default => false
  end
end
