In this section lets add some "partials" to our website.

A partial is a ruby name for an erb template that creates a small bit of functionality that can be included or used repeatedly.

So, a partial is a small bit of code that you include in your layout file or html pages.

The benefit of a partial is that you can cut up your site into small files, focusing on small modules of functionality rather than one large mess.

The other benefit to partials is that you can code in one place and include them in other spots. Imagine having to edit every single .html or .md file because you wanted to update the phone number on your footer? Tedious work that can be avoided by using a partial

## Create a bootstrap nav partial

Let's create a bootstrap navbar partial in our layout file.

Call it ```_navbar.html.erb```

Inside it, let's create a very basic navbar using Bootstrap's UI framework.

```html
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <img alt="Brand" src="...">
      </a>
    </div>
  </div>
</nav>
```

Let's include that in our layout.erb file, just above the yield statement.

```
<%= partial "/layouts/navbar" %>
```

The /layouts/ just tells Middleman which folder the partial is in starting from the root of the source file. If you want, you can create a seperate partials or views files to place it in. If you create a seperate file for the partials called partials then your erb would look like ```<%= partial "/partials/navbar" %>```.