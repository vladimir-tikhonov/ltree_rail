module LtreeRails
  module Model
    extend ActiveSupport::Concern

    included do
      belongs_to :parent,
                 foreign_key: ltree_config.parent_column_name.to_s,
                 class_name: self,
                 inverse_of: :children

      has_many :children,
               foreign_key: ltree_config.parent_column_name.to_s,
               dependent: ltree_config.children_dependent,
               class_name: self,
               inverse_of: :parent
    end
  end
end