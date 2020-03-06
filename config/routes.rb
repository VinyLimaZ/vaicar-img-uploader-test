# frozen_string_literal: true

Rails.application.routes.draw do
  resources :images, only: %i[new create show index], param: :slug
end
