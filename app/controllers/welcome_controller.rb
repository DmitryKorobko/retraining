class WelcomeController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index]
  # before_action load_and_authorize_resource
end
