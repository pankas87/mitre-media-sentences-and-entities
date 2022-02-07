Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/sentences", to: "sentences#index"
  get "/sentences/:id", to: "sentences#show"
  post "/sentences/:sentence_id/entities", to: "entities#create"
end
