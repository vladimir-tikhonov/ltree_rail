module LtreeRails
  class Configuration
    include ActiveSupport::Configurable

    delegate :[], :[]=, to: :config

    CONFIGURABLE_OPTIONS = {
      parent_column_name: 'parent_id',
      path_column_name: 'path',
      label_column_name: 'id',
      children_dependent: :nullify
    }.freeze

    CONFIGURABLE_OPTIONS.each do |option, default|
      config_accessor(option) { default }
    end
  end
end
