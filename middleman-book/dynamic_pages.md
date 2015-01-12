# Adding dynamic pages

Following on from leveraging data from yaml or json, we are now going to jump into a technique that makes Middleman really shine

We are going to dynamically create Middleman pages from yaml.

Essentially, we get to make a yaml document that contains all of the departments/services we offer with some standarized information inside them and we can use that to generate, using a single template, several pages.

This is a great time saver and allows you to have a single source of truth (your yaml file) which helps create several html pages.

Configuration can be a little tricky at first but once you get it working once, you'll be using this to rapidly create pages in no time.

### create data folder and sample .yml file

```yml
# data/services.yml

service:
 - name: "Medical Imaging"
   slug: medical-imaging
   description: ""
   banner-image: ""
 
 - name: "Medical physics"
   slug: medical-physics
   description: ""
   banner-image: ""
```

### Add proxy method to config

Open up your ```config.rb``` file and add the following:

```ruby
data.services.service.each do |name|
  proxy "/service/#{name.slug}.html", "/services/template.html", :locals => { :name => name }, :ignore => true
end
```

### Create service directory and template

```html
<%= name['slug'] %>
```

### Run build and cross those fingers