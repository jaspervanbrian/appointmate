class CreateBookingTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_types do |t|
      t.string :name
      t.string :type
      t.string :color
      t.integer :duration
      t.boolean :payment_required
      t.integer :price
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
