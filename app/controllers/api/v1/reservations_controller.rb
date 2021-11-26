class Api::V1::ReservationsController < ActionController::API
  include ParamsHelper
  
  def create_update
    @guest = Guest.new(guest_params)
    handle_reservation('create')
    if @guest.save
      # Return Guest object if successfully saved
      render json: @guest.to_json(include: [:reservations]), status: :ok
    else
      #Validate if guest error is email validation
      if @guest.errors[:email]
        handle_existing_guest
      else
        render json: @guest.errors[:email], status: 404
      end
    end
  end

  private


  # Handle existing guest
  def handle_existing_guest
      # Update guest if email exists
      @existing_guest = Guest.find_by_email(@guest.email)
      handle_reservation('update')
      if @existing_guest.update(guest_params)
        render json: @guest.to_json(include: [:reservations]), status: :ok
      else
        render json: @guest.errors, status: 404
      end
  end

  # Handle reservation creation / update
  def handle_reservation(method = 'create')
    if method == 'create'
      @reservation = @guest.reservations.build(reservation_params)
    else
      code = reservation_params[:reservation_code] || reservation_params[:code]
      existing_resevation = Reservation.find_by_code(code)
      # Update existing reservation for existing guest
      if existing_resevation.present?
        existing_resevation.update(reservation_params)
      else
        # Create new reservation for existing guest
        @existing_guest.reservations.build(reservation_params)
      end
    end
  end

  
  
  # Define reservation strong params
  # Add new permitted params to ParamsHelper
  def reservation_params
    params.require(:reservation).permit(*airbnb_reservation_params, *booking_reservation_params)
  end

  def guest_params
    if params.has_key?(:guest)
      params.require(:guest).permit(*airbnb_guest_params, *booking_guest_params)
    else 
      params.require(:reservation).permit(*booking_guest_params, *airbnb_guest_params)
    end
  end

end