require 'spree/rackspace_cloud_files_configuration'

module Spree::RackspaceCloudFiles; end

module SpreeRackspaceCloudFiles
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_rackspace_cloud_files'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.rackspace_cloud_files.preferences", :after => "spree.environment" do |app|
      Spree::RackspaceCloudFiles::Config = Spree::RackspaceCloudFilesConfiguration.new
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
