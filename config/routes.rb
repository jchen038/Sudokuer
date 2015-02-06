Rails.application.routes.draw do
  root to: 'puzzles#index'
  resources :puzzles do
    member do
      get 'solve'
    end
  end

end
