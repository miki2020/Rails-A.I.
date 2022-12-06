Rails.application.routes.draw do
  resources :runners
  resources :readings, :path => '/'
  get '/reading/build_dataset/:id', to: 'readings#build_dataset', as: 'build_dataset'
end
