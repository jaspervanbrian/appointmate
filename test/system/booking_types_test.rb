require "application_system_test_case"

class BookingTypesTest < ApplicationSystemTestCase
  setup do
    @booking_type = booking_types(:one)
  end

  test "visiting the index" do
    visit booking_types_url
    assert_selector "h1", text: "Booking types"
  end

  test "should create booking type" do
    visit booking_types_url
    click_on "New booking type"

    fill_in "Color", with: @booking_type.color
    fill_in "Duration", with: @booking_type.duration
    fill_in "Name", with: @booking_type.name
    fill_in "Patient", with: @booking_type.patient_id
    check "Payment required" if @booking_type.payment_required
    fill_in "Price", with: @booking_type.price
    fill_in "Type", with: @booking_type.type
    click_on "Create Booking type"

    assert_text "Booking type was successfully created"
    click_on "Back"
  end

  test "should update Booking type" do
    visit booking_type_url(@booking_type)
    click_on "Edit this booking type", match: :first

    fill_in "Color", with: @booking_type.color
    fill_in "Duration", with: @booking_type.duration
    fill_in "Name", with: @booking_type.name
    fill_in "Patient", with: @booking_type.patient_id
    check "Payment required" if @booking_type.payment_required
    fill_in "Price", with: @booking_type.price
    fill_in "Type", with: @booking_type.type
    click_on "Update Booking type"

    assert_text "Booking type was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking type" do
    visit booking_type_url(@booking_type)
    click_on "Destroy this booking type", match: :first

    assert_text "Booking type was successfully destroyed"
  end
end
