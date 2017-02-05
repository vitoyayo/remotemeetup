# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(
  jquery.min.js
  jquery.easing.1.3.js
  bootstrap.min.js
  jquery.waypoints.min.js
  jquery.stellar.min.js
  owl.carousel.min.js
  jquery.flexslider-min.js
  jquery.countTo.js
  jquery.magnific-popup.min.js
  magnific-popup-options.js
  main.js
  modernizr-2.6.2.min.js
  template/animate.css
  template/icomoon.css
  template/bootstrap.css
  template/magnific-popup.css
  template/owl.carousel.min.css
  template/owl.theme.default.min.css
  template/flexslider.css
  template/style.css
  template/animate.css
  template/animate.css
)
