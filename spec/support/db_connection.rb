require 'active_record'
require 'yaml'

db_config = YAML::load_file(File.expand_path('../../db/database.yml', __FILE__))
ActiveRecord::Base.establish_connection(db_config)
load File.expand_path('../../db/schema.rb', __FILE__)
require File.expand_path('../../db/models.rb', __FILE__)