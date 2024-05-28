# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'employees#index'

  resources :employees

  get 'employees_chart', to: 'employees#chart'
end
