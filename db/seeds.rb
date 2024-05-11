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

hospital = Hospital.create(
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

hospital_1 = Hospital.create(
  name: "Balmain Hospital",
  booking_link: "balmain",
  landline_number: "02 9395 2111 ",
  fax: "02 9395 2119",
  street_address: "29 Booth Street",
  suburb_address: "Balmain",
  postcode_address: "NSW",
  state_address: "2041",
  email: "SLHD-Balmain@health.nsw.gov.au",
  password: "secret",
  password_confirmation: "secret"
)

BookingType.create!(
  color: "#8ba832",
  description: "RPAH Medical Centre combines the things you love about a traditional family practice; GPs you know and trust, personalised care and advice and a welcoming and safe atmosphere, alongside the latest diagnostic and medical equipment of a state-of-the-art accredited medical centre.",
  duration: 30,
  location: "Telehealth/In-Person",
  name: "General Practitioner",
  payment_required: true,
  price: 20,
  hospital: 
)

BookingType.create!(
  color: "#38bdf8",
  description: "Offering advanced cancer care and support for patients battling cancer.",
  duration: 60,
  location: "In-Person",
  name: "Cancer Center",
  payment_required: true,
  price: 60,
  hospital: 
)

BookingType.create!(
  color: "#fbbf24",
  description: "Specializing in comprehensive heart disease prevention and treatment.",
  duration: 60,
  location: "In-Person",
  name: "Cardiology",
  payment_required: true,
  price: 30,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Providing expert care for conditions affecting the head, neck, and throat.",
  duration: 60,
  location: "In-Person",
  name: "Head and Neck",
  payment_required: true,
  price: 40,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Delivering confidential care and support for sexual health concerns.",
  duration: 60,
  location: "Telehealth/In-Person",
  name: "Sexual Health Care",
  payment_required: true,
  price: 20,
  hospital: 
)

BookingType.create!(
  color: "#33bef8",
  description: "Specializing in the diagnosis and treatment of urological disorders.",
  duration: 60,
  location: "In-Person",
  name: "Urology",
  payment_required: true,
  price: 40,
  hospital: 
)

BookingType.create!(
  color: "#fbbf24",
  description: "Providing advanced surgical solutions for neurological conditions.",
  duration: 60,
  location: "In-Person",
  name: "Neurosurgery",
  payment_required: true,
  price: 60,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Restoring mobility and function through specialized orthopedic care.",
  duration: 60,
  location: "In-Person",
  name: "Orthopaedics",
  payment_required: true,
  price: 30,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Offering compassionate care and support for patients with serious illnesses.",
  duration: 60,
  location: "Telehealth/In-Person",
  name: "Palliative Care",
  payment_required: true,
  price: 40,
  hospital: 
)

BookingType.create!(
  color: "#38bdf8",
  description: "Delivering accurate diagnostic imaging services for effective patient care.",
  duration: 60,
  location: "In-Person",
  name: "Radiology/Medical Imaging",
  payment_required: true,
  price: 30,
  hospital:
)

BookingType.create!(
  color: "#fbbf24",
  description: "Nurturing the next generation of medical professionals through mentorship and training.",
  duration: 60,
  location: "Online/In-Person Lecture",
  name: "Basic Physician Training Network",
  payment_required: true,
  price: 100,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Providing comprehensive healthcare services for women and newborns.",
  duration: 60,
  location: "Telehealth/In-Person",
  name: "Women and Babies Services",
  payment_required: true,
  price: 30,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Offering personalized care for autoimmune and inflammatory conditions. ",
  duration: 60,
  location: "In-Person",
  name: "Rheumatology",
  payment_required: true,
  price: 20,
  hospital: 
)

BookingType.create!(
  color: "#34d399",
  description: "Care for patients with stroke, serious injury or who require rehabilitation after surgery or an illness of cancer treatment. ",
  duration: 120,
  location: "In-Person",
  name: "Rehabilitation",
  payment_required: true,
  price: 80,
  hospital: hospital_1
)

BookingType.create!(
  color: "#fbbf24",
  description: "Our dedicated nurses and midwives are committed to ensuring that all our patients, consumers and their families receive exceptional patient and family centred care.",
  duration: 70,
  location: "In-Person",
  name: "Nursing",
  payment_required: true,
  price: 80,
  hospital: hospital_1
)

BookingType.create!(
  color: "#fbbf24",
  description: "Providing care to older people and people with disabilities, as well as rehabilitation for people recovering from illness or injury.",
  duration: 180,
  location: "In-Person",
  name: "Aged Health, Chronic Care & Rehabilitation",
  payment_required: true,
  price: 150,
  hospital: hospital_1
)

puts "Reset complete 👨‍💻🎉🔥"
