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
end
