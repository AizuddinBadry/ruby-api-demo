class Reservation < ApplicationRecord
    # Include corncern
    include StatusEnums, ReservationConcern

    belongs_to :guest, optional: true

    validates :code, uniqueness: { message: ->(_object, data) do 
                                            "#{data[:value]} is already exists."
                                            end }


end
