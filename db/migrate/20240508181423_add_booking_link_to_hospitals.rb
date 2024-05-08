class AddBookingLinkToHospitals < ActiveRecord::Migration[7.1]
  def change
    add_column :hospitals, :booking_link, :string
    add_index :hospitals, :booking_link, unique: true
  end
end
