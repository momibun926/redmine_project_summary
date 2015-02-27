Rails.application.routes.draw do
  resources :projects do
    resources :project_summary
  end
end