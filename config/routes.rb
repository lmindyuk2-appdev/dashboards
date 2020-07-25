Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex",{:controller => "currencies",:action => "first_currency"})
  get("/forex/:first_currency",{:controller => "currencies",:action => "second_currency"})
  get("/forex/:first_currency/:second_currency",{:controller => "currencies",:action => "exchange_rate"})
end
