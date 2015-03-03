module LtreeRails
  module Support
    extend ActiveSupport::Concern

    COLUMNS_ACCESSIBLE = %w( parent label path )

    included do
      COLUMNS_ACCESSIBLE.each do |c|
        define_method("_ltree_#{c}_column_value") do
          read_attribute(self.class.ltree_config["#{c}_column_name"])
        end

        define_method("_ltree_#{c}_column_value=") do |value|
          write_attribute(self.class.ltree_config["#{c}_column_name"], value)
        end
      end
    end

    module ClassMethods
      COLUMNS_ACCESSIBLE.each do |c|
        define_method("_ltree_#{c}_column_name") do
          ltree_config["#{c}_column_name"].to_s
        end
      end
    end
  end
end
