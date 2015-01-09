# Add local data

A key strength of Middleman is the ability to inject data into your templates using yml/yaml or json.

You can achive these two ways, one by providing the data in individual templates, the second by referring to a data folder

In this section we'll use both. Let's start by using some local data from a template heading.

## Using Frontmatter data

In each of your html.erb files you are able to section off the header and provide some .yml or .json information.

This could be the page's title, important links or the date of the article.

Let's build a very simple example.

At the very top of your index.html.erb file should be the title attribute between two sets of triple dashes ```---```.

This deliminates a yaml section. Essentially everything in here is yaml and can be referred to.

Here is what I changed mine to:

```yaml
---
title: Medical Imaging &amp; Medical Physics
---
```

To refer to that data within a template you need to use the method ```current_page.data``` within an erb tag.

To actually target the individual piece of data you add a ```.``` and the name of the attribute you want.

In my case I want to add the title within the ```<h1>``` html element so I call ```.title``` after ```current_page.data```.

So, my markup looks like this:

```html
<section id="intro">
  <div class="container">
    <div class="row">
      <h1><%= current_page.data.title %></h1>
    </div>
  </div>
</section>
```