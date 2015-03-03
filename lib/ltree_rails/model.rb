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

      after_create :update_path
    end

    def root?
      persisted? ? _ltree_parent_column_value.nil? : parent.nil?
    end

    def child?
      !root?
    end

    private

    def update_path
      update_column(self.class._ltree_path_column_name, compute_path)
    end

    def compute_path
      if root?
        _ltree_label_column_value.to_s
      else
        ::LtreeRails::Utils::PathUtils.combine_paths(parent._ltree_path_column_value,
                                                     _ltree_label_column_value)
      end
    end
  end
end
