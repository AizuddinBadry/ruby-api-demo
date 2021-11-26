class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.text :code
      t.date :start_date
      t.date :end_date
      t.bigint :nights
      t.bigint :adults
      t.bigint :children
      t.bigint :infants
      t.bigint :status, default: 0
      t.text :currency
      t.float :payout_price
      t.float :security_price
      t.float :total_price

      t.timestamps
    end
  end
end
