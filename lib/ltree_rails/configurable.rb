module LtreeRails
  module Configurable
    extend ActiveSupport::Concern

    class_methods do
      def ltree_config
        @_ltree_config ||= ::LtreeRails::Configuration.new
      end
    end
  end
end