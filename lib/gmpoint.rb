module Gmpoint
  class Engine < Rails::Engine
    ## Code starts here
    
    ActiveRecord::Base.instance_eval do
      def super_function
        true
      end
    end
  end
end