class CreateBookingTypeStaffs < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_type_staffs do |t|
      t.references :booking_type, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
