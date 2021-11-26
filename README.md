##### 1. Check out the repository

```bash
git clone https://github.com/AizuddinBadry/ruby-api-demo.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

#### Accepting a new payload

##### 1. Add new payload structure to `params_helper.rb`

```
    def new_params
        [
            :reservation_code, :start_date,
            :end_date, :nights, :guests,
            :adults, :children, :infants,
            :status, :total_price,
            :currency, :payout_price, :security_price
        ]
    end
```

##### 2. Add new params structure to strong params into `reservations_controller.rb`

```ruby
  # Define reservation strong params
  # Add new permitted params to ParamsHelper
  def reservation_params
    params.require(:reservation).permit(*airbnb_reservation_params, *booking_reservation_params, *new_params)
  end

  def guest_params
    if params.has_key?(:guest)
      params.require(:guest).permit(*airbnb_guest_params, *booking_guest_params, *new_params)
    else
      params.require(:reservation).permit(*booking_guest_params, *airbnb_guest_params, *new_params)
    end
  end
```

##### 3. Add new created payload into ActiveRecord::Concern if structured payload is different

`reservation_concern.rb`

```ruby
 module ReservationConcern
  extend ActiveSupport::Concern

  included do
    alias_attribute :reservation_code, :code
    alias_attribute :expected_payout_amount, :payout_price
    alias_attribute :number_of_adults, :adults
    alias_attribute :number_of_children, :childrens
    alias_attribute :number_of_infants, :infants
    alias_attribute :listing_security_price_accurate, :security_price
    alias_attribute :host_currency, :currency
    alias_attribute :status_type, :status
    alias_attribute :total_paid_amount_accurate, :total_price
    alias_attribute :guest, :number_of_guests

    alias_attribute :new_params, :existing_attribute
  end
end
```

#### Run Rspec test suites

```
bundle exec rspec spec 
```
