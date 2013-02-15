class Spree::RackspaceCloudFilesConfiguration < Spree::Preferences::Configuration
  preference :use_cloud_files, :boolean, :default => false

  preference :rackspace_api_username, :string, :default => ''
  preference :rackspace_api_key, :string, :default => ''
  preference :rackspace_cloud_files_bucket, :string, :default => ''
end
