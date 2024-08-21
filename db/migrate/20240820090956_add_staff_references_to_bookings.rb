class AddStaffReferencesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :staff_id, :integer
  end
end
