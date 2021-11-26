Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      match :reservations, to: 'reservations#create_update', via: [:patch, :post]
    end
  end
end
