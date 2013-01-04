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
      
      def copy_js_file
        ["locations.js.coffee", "jquery.fancybox-1.3.4.js", "jquery.mousewheel-3.0.4.pack.js"].each do |file|
          copy_file "../../../app/assets/javascripts/#{file}", "app/assets/javascripts/#{file}"
        end
      end
      
      def copy_style_file
        copy_file "../../../app/assets/stylesheets/jquery.fancybox-1.3.1.css", "app/assets/stylesheets/jquery.fancybox-1.3.1.css"
      end
      
      def copy_images
        ["blank.gif", "fancy_close.png", "fancy_loading.png", "fancy_nav_left.png", "fancy_nav_right.png", "fancy_shadow_e.png", "fancy_shadow_e.png", "fancy_shadow_ne.png", "fancy_shadow_nw.png", "fancy_shadow_s.png", "fancy_shadow_se.png", "fancy_shadow_sw.png", "fancy_shadow_w.png", "fancy_title_left.png", "fancy_title_main.png", "fancy_title_over.png", "fancy_title_right.png", "fancybox-x.png", "fancybox-y.png", "fancybox.png", "Jcrop.gif"].each do |file|
          copy_file "../../../app/assets/images/#{file}", "app/assets/images/#{file}"
        end
      end
      
    end
  end
end