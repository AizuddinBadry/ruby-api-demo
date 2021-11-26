class AddNumberOfGuestToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :number_of_guests, :bigint, default: 0
  end
end
