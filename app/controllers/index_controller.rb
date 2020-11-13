class IndexController < ApplicationController
  skip_before_action :authorized
end
