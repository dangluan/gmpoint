module Gmpoint
  class Engine < Rails::Engine
    
    ActiveRecord::Base.extend(Gmpoint::ClassMethods)
    
    ActiveRecord::Base.class_eval do
      include ActionView::Helpers::JavaScriptHelper
    end
    
    ActionController::Base.extend(Gmpoint::ControllerMethods)
    
  end
end