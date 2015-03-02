module LtreeRails
  module Model
    extend ActiveSupport::Concern

    included do
      belongs_to :parent,
                 foreign_key: _ltree_parent_column_name,
                 class_name: self,
                 inverse_of: :children

      has_many :children,
               foreign_key: _ltree_parent_column_name,
               dependent: ltree_config.children_dependent,
               class_name: self,
               inverse_of: :parent
    end

    def root?
      persisted? ? _ltree_parent_column_value.nil? : parent.nil?
    end

    def child?
      !root?
    end
  end
end