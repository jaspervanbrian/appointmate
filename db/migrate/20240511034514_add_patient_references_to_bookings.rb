class AddPatientReferencesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :patient_id, :integer
  end
end
