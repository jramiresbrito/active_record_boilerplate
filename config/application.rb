require 'active_record'
require 'sqlite3'
require 'yaml'

# DB connection
config_path = File.join(File.dirname(__FILE__), 'database.yml')
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.estabilish_connection(:development)

# Set the logger
logger = Logger.new(STDOUT)
logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
ActiveRecord::Base.logger = logger

# Load models
Dir["#{__dir__}/../app/models/*.rb"].sort.each { |file| require file }
