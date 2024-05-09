class BookingType < ApplicationRecord
  belongs_to :hospital
  has_rich_text :description
  has_many :bookings
end
