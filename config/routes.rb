Rails.application.routes.draw do
  root to: "floors#index", locale: I18n.default_locale

  scope "(/:locale)" do
    devise_for :admins, path: :admin, only: [:sessions, :registrations], path_names: {
      sign_in: :login,
      sign_out: :logout,
      sign_up: :signup
    }, controllers: {
      sessions: "sessions",
      registrations: "registrations"
    }

    draw :api
    resources :users
    resources :floors
    resources :contracts

    namespace :batch_create do
      resources :users, only: :create
    end
  end
end
