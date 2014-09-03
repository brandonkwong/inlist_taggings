InlistTaggings::Application.routes.draw do

  scope '/api' do
    resources :items, defaults: { format: :json }
    resources :tags, only: [:index, :destroy], defaults: { format: :json }
  end

  root 'static#index'

end
