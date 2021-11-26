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
  end
end