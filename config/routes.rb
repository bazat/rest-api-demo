Rails.application.routes.draw do

  get     "/products",     to: "products#index"
  post    "/products",     to: "products#create"
  get     "/products/:id", to: "products#show"
  put     "/products/:id", to: "products#update"
  delete  "/products/:id", to: "products#destroy"

  get     "/orders",     to: "orders#index"
  post    "/orders",     to: "orders#create"
  get     "/orders/:id", to: "orders#show"
  put     "/orders/:id", to: "orders#update"
  delete  "/orders/:id", to: "orders#destroy"

end