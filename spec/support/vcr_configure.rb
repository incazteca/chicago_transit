require 'rails_helper'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassetes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
