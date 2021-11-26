module ParamsHelper
  extend ActiveSupport::Concern

    # Airbnb reservation permitted params
    def airbnb_reservation_params
        [ 
            :reservation_code, :start_date,
            :end_date, :nights, :guests,
            :adults, :children, :infants, 
            :status, :total_price,
            :currency, :payout_price, :security_price
            
        ]
    end

    # Airbnb guest permitted params
    def airbnb_guest_params
        [ 
            :first_name, :last_name, :phone, :email
        ]
    end

    # Booking.com permitted params
    def booking_reservation_params
        [ 
            :code, :start_date,
            :end_date, :expected_payout_amount,
            :listing_security_price_accurate, 
            :host_currency, :nights, :number_of_guests, 
            :status_type, :total_paid_amount_accurate
        ]
    end

    # Booking.com guest permitted params
    def booking_guest_params
        [ 
            :guest_email, :guest_first_name, :guest_last_name, {guest_phone_numbers:[]}
        ]
    end
end