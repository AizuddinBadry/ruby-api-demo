require 'rails_helper'
require 'faker'

describe "post a reservation route", :type => :request do
    currency = ['AUD', 'USD', 'MYR']
    status = ['completed', 'accepted', 'pending']
    code = Faker::Code.npi
    before do
        post '/api/v1/reservations', params: 
        {reservation:{ 
            :reservation_code => code, 
            :start_date => Faker::Date.between(from: '2021-09-23', to: '2021-12-25'), 
            :end_date => Faker::Date.between(from: '2021-09-23', to: '2021-12-25'), 
            :nights => Faker::Number.within(range: 1..10), 
            :children => Faker::Number.within(range: 1..10), 
            :infants => Faker::Number.within(range: 1..10), 
            :status => status.sample, 
            first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, 
            :currency => currency.sample,
            :payout_price => Faker::Number.decimal(l_digits: 3, r_digits: 3),
            :security_price => Faker::Number.decimal(l_digits: 3, r_digits: 3),
            :total_price => Faker::Number.decimal(l_digits: 3, r_digits: 3),
             
        }}
    end
    # Returns guest with associated reservations
    it 'returns the reservations' do
        expect(JSON.parse(response.body)['reservations'][0]['code']).to eq(code)
    end
end