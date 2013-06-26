require 'spec_helper'

describe GoogleApi, "config" do
  it "comes from a module" do #simple test to init tests
    GoogleApi.should be_a_kind_of(Module)
  end
  it "throws an error if no client id" do
    lambda{
      GoogleApi.config do |config|
        config.client_id = nil
      end
    }.should raise_error(GoogleApi::Rails::Exception::BadClientId)
  end
  it "throws an error if no client secret" do
    lambda{
      GoogleApi.config do |config|
        config.client_id = '123'
        config.client_secret = nil
      end
    }.should raise_error(GoogleApi::Rails::Exception::BadClientSecret)
  end
  it "throws an error if no application name" do
    lambda{
      GoogleApi.config do |config|
        config.client_id = '123'
        config.client_secret = '123'
      end
    }.should raise_error(GoogleApi::Rails::Exception::BadApplicationName)
  end
  it "throws an error if no application version" do
    lambda{
      GoogleApi.config do |config|
        config.client_id = '123'
        config.client_secret = '123'
        config.application_name = '123'
      end
    }.should raise_error(GoogleApi::Rails::Exception::BadApplicationVersion)
  end
  it "should allow empty redirect_url" do
    lambda{
      GoogleApi.config do |config|
        config.client_id = '123'
        config.client_secret = '123'
      end
    }.should_not raise_error(ArgumentError)
  end
end
