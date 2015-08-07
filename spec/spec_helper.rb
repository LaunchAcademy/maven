require "pry"
require "rspec"
require "capybara/rspec"
require "factory_girl"

require_relative "../server"

set :environment, :test
set :database, :test

ActiveRecord::Base.logger.level = 1

FactoryGirl.definition_file_paths = ['./spec/factories']
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.backtrace_exclusion_patterns << /.gem/
  config.include FactoryGirl::Syntax::Methods
end

Capybara.app = Sinatra::Application
