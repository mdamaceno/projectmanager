require 'hanami/model'
require 'hanami/mailer'
Dir["#{__dir__}/support/**/*.rb"].each { |file| require_relative file }
Dir["#{__dir__}/projectmanager/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/projectmanager_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/projectmanager_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/projectmanager_development'
  #    adapter type: :sql, uri: 'mysql://localhost/projectmanager_development'
  #
  adapter type: :sql, uri: ENV['PROJECTMANAGER_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  # mapping do
  # collection :users do
  #   entity     User
  #   repository UserRepository
  #
  #   attribute :id,   Integer
  #   attribute :name, String
  # end
  # end
end.load!

Hanami::Mailer.configure do
  root "#{__dir__}/projectmanager/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
