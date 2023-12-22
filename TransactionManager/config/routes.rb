Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :transactions, only: [:index, :edit, :update, :create, :new, :show, :destroy] do
        collection do
          get :archive
          get :filter
        end
      end
    end
  end
end
