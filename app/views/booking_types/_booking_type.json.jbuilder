json.extract! booking_type, :id, :name, :type, :description, :color, :duration, :payment_required, :price, :hospital_id, :created_at, :updated_at
json.url booking_type_url(booking_type, format: :json)
json.description booking_type.description.to_s
