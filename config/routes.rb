Rails.application.routes.draw do
  resources :upvotes
  resources :alarms
  scope '/api' do
    resources :alarms, except: [:new, :edit]
    resources :upvotes, except: [:new, :edit]
    post 'alarms/endpt' => 'alarms#post_to_handshake'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
