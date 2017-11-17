class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  #before_filter :popular_treatments, :find_search, :only => [:index, :show, :edit, :new]
end
