module LtreeRails
  module HasLtree
    extend ActiveSupport::Concern

    module ClassMethods
      def has_ltree(opt = {})
        include ::LtreeRails::Configurable
      end

      alias_method :act_as_ltree, :has_ltree
    end
  end
end
