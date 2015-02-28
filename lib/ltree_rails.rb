require 'ltree_rails/version'
require 'active_support'

module LtreeRails
  extend ActiveSupport::Autoload

  autoload :HasLtree
  autoload :Configuration
  autoload :Configurable
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send(:include, ::LtreeRails::HasLtree)
end