# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
  end
  