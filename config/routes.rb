Rails.application.routes.draw do
  root to: 'puzzles#index'
  resources :puzzles do
    member do
      post 'build'
      post 'solve'
      # get 'save'
    end
  end
end
