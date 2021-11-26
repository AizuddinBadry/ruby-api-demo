class AddGuestToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :guest, null: false, index: true, foreign_key: true
  end
end
