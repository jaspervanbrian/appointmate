class AddBookingLinkToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :booking_link, :string
    add_index :patients, :booking_link, unique: true
  end
end
