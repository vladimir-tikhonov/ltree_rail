module LtreeRails
  class Configuration
    include ActiveSupport::Configurable

    CONFIGURABLE_OPTIONS = {
      parent_id_column: 'parent_id',
      path_column: 'path',
      label_column: 'parent_id'
    }

    CONFIGURABLE_OPTIONS.each do |option, default|
      config_accessor(option) { default }
    end
  end
end