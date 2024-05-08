# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Patient.create(
  first_name: "Jasper",
  last_name: "Martin",
  email: "jaspervanbrianmartin@gmail.com",
  password: "secret",
  password_confirmation: "secret"
)

Hospital.create(
  name: "Royal Prince Alfred Hospital",
  booking_link: "rpa",
  landline_number: "02 9515 6111",
  fax: "02 9515 6133",
  street_address: "50 Missenden Rd",
  suburb_address: "Camperdown",
  postcode_address: "NSW",
  state_address: "2050",
  email: "SLHD-RPASupportUnit@health.nsw.gov.au",
  password: "secret",
  password_confirmation: "secret"
)
