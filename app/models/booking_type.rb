class BookingType < ApplicationRecord
  belongs_to :patient
  has_rich_text :description
  has_many :bookings
end
