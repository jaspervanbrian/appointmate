class Booking < ApplicationRecord
  has_person_name
  belongs_to :booking_type
  belongs_to :patient, optional: true
  has_rich_text :notes

  enum status: { pending: 0, approved: 1, unapproved: 2 }
end
