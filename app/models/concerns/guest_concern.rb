module GuestConcern
  extend ActiveSupport::Concern

  included do
    alias_attribute :guest_email, :email
    alias_attribute :guest_first_name, :first_name
    alias_attribute :guest_last_name, :last_name
    alias_attribute :guest_phone_numbers, :phone
  end
end