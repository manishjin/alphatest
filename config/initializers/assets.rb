# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( jqBootstrapValidation.js )
Rails.application.config.assets.precompile += %w( footable.js )
Rails.application.config.assets.precompile += %w( contact_me.js )
Rails.application.config.assets.precompile += %w( agency.js )
Rails.application.config.assets.precompile += %w( footable.bootstrap.min.css )
Rails.application.config.assets.precompile += %w( themecustom.scss.erb )
Rails.application.config.assets.precompile += %w( custom.scss.erb )
Rails.application.config.assets.precompile += %w( sidebarcustom.scss )
Rails.application.config.assets.precompile += %w( raphael.js )
Rails.application.config.assets.precompile += %w( morris.js )
Rails.application.config.assets.precompile += %w( morris.scss )