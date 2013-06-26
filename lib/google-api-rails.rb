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
  mattr_accessor :redirect_uri
  @@redirect_uri = ""
  mattr_accessor :scope
  @@scope = ""

  def self.config
    yield self
    raise Rails::Exception::BadClientId.new if @@client_id.nil? || @@client_id.empty?
    raise Rails::Exception::BadClientSecret.new if @@client_secret.nil? || @@client_secret.empty?

    @@client = Google::APIClient.new
    @@client.authorization.client_id = @@client_id
    @@client.authorization.client_secret = @@client_secret
    @@client.authorization.redirect_uri = @@redirect_uri
    @@client.authorization.scope = @@scope
  end
end