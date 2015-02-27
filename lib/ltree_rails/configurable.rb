module LtreeRails
  module Configurable
    extend ActiveSupport::Concern

    CONFIGURABLE_OPTIONS = %i( parent_id_column path_column ).freeze

    class_methods do
      def ltree_config
        @_ltree_config ||= Struct.new(*CONFIGURABLE_OPTIONS)
      end
    end
  end
end