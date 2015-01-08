make sure you install via a gem bootstrap.

```ruby
gem "bootstrap-sass", :require => false
```

running bundle install afterwards!

```bash
bundle install
```

Update your sprockets info

```sprockets.import_asset 'bootstrap'```

Import the bootstrap Scss into your Scss file above your variables

```sass
@import "bootstrap-sprockets";
@import "bootstrap";
```

> If you are using a theme do this:
>```
@import "bootstrap-sprockets";
@import "_variables.scss";
@import "bootstrap";
@import "_bootswatch.scss";`
```
> We include the ```_variables.scss``` file above bootstrap so that it uses the settings found in there.

Ensure relative assets if looking at your file every once in a while
```ruby
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

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
```

In the command-line run the build process again:

middleman build

> If you want to see the things that Middleman does to convert your site, run the command with the verbose flag after your command like so ```middleman build --verbose```

Change your tags to include your JavaScript using the erb helper

```<%= stylesheet_link_tag "name_of_spreadsheet_here" %> ```

your /layouts/layout.erb file should look something like this:

```erb
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    
    <!-- Always force latest IE rendering engine or request Chrome Frame -->
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    
    <!-- Use title if it's in the page YAML frontmatter -->
    <title><%= current_page.data.title || "The Middleman" %></title>
    <%= javascript_include_tag  "jquery" %>
    <%= stylesheet_link_tag "main" %>
  </head>
  
  <body class="<%= page_classes %>">
    <%= yield %>
    

    <%= javascript_include_tag  "bootstrap" %>
    <%= javascript_include_tag  "all" %>
  </body>
</html>
```

You may have noticed that I included all of the bootstrap JavaScript down to the bottom, this is to let things load before the bootstrap.js has finished loading

Make sure that your