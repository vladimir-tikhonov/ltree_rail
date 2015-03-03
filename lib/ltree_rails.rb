require 'ltree_rails/version'
require 'ltree_rails/utils/path_utils'
require 'active_support'

module LtreeRails
  extend ActiveSupport::Autoload

  autoload :HasLtree
  autoload :Configuration
  autoload :Configurable
  autoload :Model
  autoload :Support
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send(:include, ::LtreeRails::HasLtree)
end
