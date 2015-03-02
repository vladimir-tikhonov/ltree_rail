module LtreeRails
  module Support
    extend ActiveSupport::Concern

    included do
      def _ltree_parent_column_value
        read_attribute(self.class._ltree_parent_column_name)
      end
    end

    module ClassMethods
      def _ltree_parent_column_name
        ltree_config.parent_column_name.to_s
      end
    end
  end
end