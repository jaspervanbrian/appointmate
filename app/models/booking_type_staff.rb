class BookingTypeStaff < ApplicationRecord
  belongs_to :booking_type
  belongs_to :staff
end
