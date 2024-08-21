class BookingType < ApplicationRecord
  belongs_to :hospital
  has_rich_text :description
  has_many :bookings

  has_many :booking_type_staffs
  has_many :staffs, through: :booking_type_staffs
end
