class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :authenticate_patient!, only: %i[ show ]
  before_action :authenticate_hospital!, only: %i[ hospital_show ]
  layout 'hospitals'

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    if @booking.patient_id != current_patient.id
      redirect_to patient_dashboard_path
    end

    @booking_type = @booking.booking_type
    @hospital = @booking_type.hospital
  end

  def hospital_show
    @booking = Booking.find(params[:id])
    @booking_type = @booking.booking_type
    @hospital = @booking_type.hospital

    if @hospital.id != current_hospital.id
      redirect_to authenticated_hospital_root_path
    else
      render 'bookings/show'
    end
  end

  # GET /bookings/new
  def new
    @hospital = Hospital.find_by(booking_link: params[:booking_link])
    @booking_type = @hospital.booking_types.find(params[:booking_type])

    @booking = Booking.new
    if patient_signed_in?
      @booking = Booking.new(
        name: current_patient.name,
        email: current_patient.email
      )
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @hospital = Hospital.find_by(booking_link: params[:booking_link])
    @booking_type = BookingType.find(params[:booking][:booking_type_id])

    additional_attributes = {
      end_at: DateTime.parse(booking_params[:start_at]) + @booking_type.duration.minutes
    }

    if patient_signed_in?
      @booking = current_patient.bookings.new(booking_params.merge(additional_attributes))
    else
      @booking = Booking.new(booking_params.merge(additional_attributes))
    end

    respond_to do |format|
      if @booking.save

        unless @booking_type.payment_required?
          @booking.approved!
          pp "Sending email to #{@booking.email}"
          AppointmentMailer.new_appointment_email(@booking, @booking_type, @hospital).deliver_now
        end

        if patient_signed_in?
          format.html { redirect_to patient_dashboard_path, notice: "Booking was successfully created." }
        else
          format.html { redirect_to hospital_path(booking_link: @hospital.booking_link), notice: "Booking was successfully created." }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def intent
    @booking_type = BookingType.find(params[:_json])
    amount = @booking_type.price * 100

    payment_intent = Stripe::PaymentIntent.create(
      amount: amount,
      currency: 'usd',
      automatic_payment_methods: {
        enabled: true
      },
      metadata: {
        hospital_id: @booking_type.hospital.id,
        booking_type_id: @booking_type.id
      }
    )

    respond_to do |format|
      format.json { render json: { clientSecret: payment_intent['client_secret'] } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @hospital = Hospital.find_by(booking_link: params[:booking_link])
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:status, :name, :notes, :booking_type_id, :first_name, :last_name, :email, :start_at, :end_at, :customer_paid)
    end
end
