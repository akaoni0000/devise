Rails.application.routes.draw do
  devise_for :users
  root "homes#top", as: "top"
  get "login_after_top" => "homes#login_after_top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
