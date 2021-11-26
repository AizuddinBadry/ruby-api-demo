module StatusEnums
    extend ActiveSupport::Concern
  
    included do
      enum status: {
        'pending': 0,
        'accepted': 1,
        'completed': 2,
      }
    end
end
  