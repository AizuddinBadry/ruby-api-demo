class Guest < ApplicationRecord
    # Include concern
    include GuestConcern

    has_many :reservations

    validates :email, uniqueness: { message: ->(_object, data) do 
                                            "#{data[:value]} is already taken."
                                            end }
end
