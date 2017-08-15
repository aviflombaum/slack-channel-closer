ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :import_slack_channels do
  SlackChannelImporter.new.import
end