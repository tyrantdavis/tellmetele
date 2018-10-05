Rails.application.routes.draw do
  get 'inquiries/index'
  get 'tvs/index'
  get 'tvs/show'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
