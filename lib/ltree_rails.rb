require 'ltree_rails/version'
require 'active_support'

module LtreeRails
  extend ActiveSupport::Autoload

  autoload :Configuration
  autoload :Configurable

  eager_autoload do
    autoload :HasLtree
  end
end
