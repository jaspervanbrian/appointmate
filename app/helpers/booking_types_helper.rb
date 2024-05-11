module BookingTypesHelper
  def duration(type)
    if type.duration >= 60
      "#{(type.duration.to_f/60).round(1)} hr#{type.duration === 60 ? "" : "s"}"
    else
      type.duration.to_formatted_s + " mins"
    end
  end
end
