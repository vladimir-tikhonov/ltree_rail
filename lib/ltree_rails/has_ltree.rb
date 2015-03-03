module LtreeRails
  module HasLtree
    extend ActiveSupport::Concern

    module ClassMethods
      def has_ltree(opt = {})
        include_dependencies
        check_options!(opt)
        apply_options(opt)
      end

      alias_method :act_as_ltree, :has_ltree

      private

      def include_dependencies
        include ::LtreeRails::Support
        include ::LtreeRails::Configurable
        include ::LtreeRails::Model
      end

      def check_options!(opt)
        opt.assert_valid_keys(*::LtreeRails::Configuration::CONFIGURABLE_OPTIONS.keys)
      end

      def apply_options(opt)
        opt.each do |option, value|
          ltree_config[option] = value
        end
      end
    end
  end
end
