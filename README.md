##### 1. Check out the repository

```bash
git clone git@github.com:organization/project-name.git
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

And now you can visit the site with the URL http://localhost:3000

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
