module LtreeRails
  module Configurable
    extend ActiveSupport::Concern

    module ClassMethods
      def ltree_config
        @_ltree_config ||= ::LtreeRails::Configuration.new
      end
    end
  end
end
