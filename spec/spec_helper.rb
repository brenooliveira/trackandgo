ENV["RACK_ENV"] = "test"
require 'pry'

if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require File.expand_path 'lib/trackandgo'
