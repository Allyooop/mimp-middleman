###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
# 

data.services.service.each do |service|
  proxy "/departments-services/#{service.slug}.html", "/services/template.html", :locals => { :service => service }, :ignore => true
end

data.departments.department.each do |department|
  proxy "/departments-services/#{department.slug}.html", "/departments/template.html", :locals => { :department => department }, :ignore => true
end

data.treatments.treatment.each do |treatment|
  proxy "/conditions-treatments/#{treatment.slug}.html", "/treatments/template.html", :locals => { :treatment => treatment }, :ignore => true
end

data.conditions.condition.each do |condition|
  proxy "/conditions-treatments/#{condition.slug}.html", "/conditions/template.html", :locals => { :condition => condition }, :ignore => true
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true
  activate :directory_indexes
  
  
  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
