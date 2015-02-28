require 'active_record'
require 'yaml'

db_config = YAML::load_file(File.join(__dir__, '..', 'db', 'database.yml'))
ActiveRecord::Base.establish_connection(db_config)