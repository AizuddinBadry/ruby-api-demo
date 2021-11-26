class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.text :email
      t.text :first_name
      t.text :last_name
      t.jsonb :phone

      t.timestamps
    end
  end
end
