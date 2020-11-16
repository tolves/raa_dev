class WelcomeController < ApplicationController
  skip_before_action :check_permission
end
