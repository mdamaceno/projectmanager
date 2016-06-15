# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'
require 'minitest/autorun'
require 'minitest/reporters'
require 'support/factory_girl'
require 'support/helpers'

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(color: true)

Hanami::Application.preload!
