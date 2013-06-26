require 'rubygems'
require 'active_support/all'
require 'google/api_client'
require 'google_api/rails/exception'

module GoogleApi
  mattr_accessor :client
  @@client = ""
  mattr_accessor :client_id
  @@client_id = ""
  mattr_accessor :client_secret
  @@client_secret = ""
  mattr_accessor :application_name
  @@application_name = ""
  mattr_accessor :application_version
  @@application_version = ""
  mattr_accessor :redirect_uri
  @@redirect_uri = ""
  mattr_accessor :scope
  @@scope = ""

  def self.config
    yield self
    raise Rails::Exception::BadClientId.new if @@client_id.nil? || @@client_id.empty?
    raise Rails::Exception::BadClientSecret.new if @@client_secret.nil? || @@client_secret.empty?
    raise Rails::Exception::BadApplicationName.new if @@application_name.nil? || @@application_name.empty?
    raise Rails::Exception::BadApplicationVersion.new if @@application_version.nil? || @@application_version.empty?

    @@client = Google::APIClient.new(:application_name => @@application_name, :application_version => @@application_version)
    @@client.authorization.client_id = @@client_id
    @@client.authorization.client_secret = @@client_secret
    @@client.authorization.redirect_uri = @@redirect_uri unless @@redirect_uri.empty? || @@redirect_uri.empty?
    @@client.authorization.scope = @@scope unless @@scope.empty? || @@scope.nil?
  end
end