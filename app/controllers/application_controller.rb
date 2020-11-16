class ApplicationController < ActionController::Base
  include Authorisation
  include Permission
end
