require 'securerandom'
require 'rails/generators'
require 'rails/generators/migration'

module Gmpoint
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates a Config file and copy locate files to your application."
      class_option :orm
      
      def copy_jsfile
        ["locations.js.coffee"].each do |file|
          copy_file "../../../app/assets/javascripts/#{file}", "app/assets/javascripts/#{file}"
        end
      end    
      
    end
  end
end