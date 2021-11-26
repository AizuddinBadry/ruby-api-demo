require 'rails_helper'
require 'faker'

describe "post a reservation route", :type => :request do
    currency = ['AUD', 'USD', 'MYR']
    status = ['completed', 'accepted', 'pending']
    code = Faker::Code.npi
    before do
        post '/api/v1/reservations', params: 
        {reservation:{ 
            :code => code, 
            :start_date => Faker::Date.between(from: '2021-09-23', to: '2021-12-25'), 
            :end_date => Faker::Date.between(from: '2021-09-23', to: '2021-12-25'), 
            :nights => Faker::Number.within(range: 1..10), 
            :children => Faker::Number.within(range: 1..10), 
            :infants => Faker::Number.within(range: 1..10), 
            :status_type => status.sample, 
            guest_first_name: Faker::Name.first_name, 
            last_name: Faker::Name.last_name, 
            guest_phone_numbers: Faker::PhoneNumber.phone_number, 
            guest_email: Faker::Internet.email, 
            :host_currency => currency.sample,
            :expected_payout_amount => Faker::Number.decimal(l_digits: 3, r_digits: 3),
            :listing_security_price_accurate => Faker::Number.decimal(l_digits: 3, r_digits: 3),
            :total_paid_amount_accurate => Faker::Number.decimal(l_digits: 3, r_digits: 3),
             
        }}
    end
    # Returns guest with associated reservations
    it 'returns the reservations' do
        expect(JSON.parse(response.body)['reservations'][0]['code']).to eq(code)
    end
end