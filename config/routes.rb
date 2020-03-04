# frozen_string_literal: true

Rails.application.routes.draw do
  resource :images, only: %i[new create]
end
