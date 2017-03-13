Rails.application.routes.draw do
  resources :alarms
  scope '/api' do
    resources :alarms, except: [:new, :edit]
    # post 'groups/even' => 'groups#even'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
