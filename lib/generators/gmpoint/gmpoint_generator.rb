module Gmpoint
  module Generators
    class GmpointGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "gmpoint"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates Gmpoint attributes for a model given its NAME."

      hook_for :orm
    end
  end
end
