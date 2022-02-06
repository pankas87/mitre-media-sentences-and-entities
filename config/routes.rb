Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/sentences", to: "sentences#index"
  post "/sentences/:sentence_id/entity", to: "entities#create"
end
