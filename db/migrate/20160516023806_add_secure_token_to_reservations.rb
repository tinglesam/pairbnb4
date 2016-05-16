class AddSecureTokenToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :secure_token, :string
  end
end
