Rails.application.routes.draw do
  devise_for :users
 resources :tasks
    root :to => redirect('/tasks')
end
