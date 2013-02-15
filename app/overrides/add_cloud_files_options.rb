Deface::Override.new(virtual_path:  'spree/admin/image_settings/edit',
                     name:          'enable_rackspace_cloud_files',
                     insert_after:  'div[data-hook=\'use_s3\']',
                     partial:       'spree/admin/image_settings/add_cloud_files_options')
