class Staff < ApplicationRecord
  has_person_name

  has_many :booking_type_staffs
  has_many :booking_type, through: :booking_type_staffs
end
