require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class GmpointGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path("../templates", __FILE__)

       def copy_gmpoint_migration
         migration_template "migration.rb", "db/migrate/gmpoint_add_columns_to_#{table_name}"
       end
    end
  end
end
