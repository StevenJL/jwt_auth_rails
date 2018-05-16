Rails.application.routes.draw do

  # sign in endpoint for rails generated frontend pages
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # sign in endpoint for mobile app or a single page web app
  post "api/v1/auth_tokens.json", to: "api/v1/auth_tokens#create"

  # api endpoint for sensitive data (ie. only available to authenticated users)
  get "api/v1/sensitive_data.json", to: "api/v1/sensitive_data#index"
end
