require_relative 'utils/path_utils'

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
      before_update :assign_path, if: -> { changes[self.class._ltree_parent_column_name].present? }
    end

    def root?
      persisted? ? _ltree_parent_column_value.nil? : parent.nil?
    end

    def child?
      !root?
    end

    def ancestors
      self_and_ancestors.where.not(self.class._ltree_label_column_name => _ltree_label_column_value)
    end

    def self_and_ancestors
      path_column = self.class.arel_table[self.class._ltree_path_column_name]
      query = Arel::Nodes::Quoted.new(_ltree_path_column_value)
      expression = Arel::Nodes::InfixOperation.new('@>', path_column, query)
      self.class.where(expression)
    end

    private

    def assign_path
      self._ltree_path_column_value = compute_path
    end

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

    def fetch_association(name)
      association_cache[name] ||= yield
    end
  end
end
