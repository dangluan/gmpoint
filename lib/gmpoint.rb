require 'gmpoint/gmpoint_controller'
module Gmpoint
  class Engine < Rails::Engine
    ActiveRecord::Base.class_eval do
      include ActionView::Helpers::JavaScriptHelper
    end
    
    ActionController::Base.extend(Gmpoint::ControllerMethod)
    
  end
end