Let's create a contact form for our middleman site.

To do this we need to create two things. The script to send the email when a form is fillled in, and the form itself.

### Steps to create JS

At the end of all that, we should be left with:

```js
jQuery(function($){
    $("#contact_form").submit(function()
    {
        var email = $("#email").val(); // get email field value
        var name = $("#name").val(); // get name field value
        var msg = $("#msg").val(); // get message field value
        $.ajax(
        {
            type: "POST",
            url: "https://mandrillapp.com/api/1.0/messages/send.json",
            data: {
                'key': 'sVRLFidC1A7K56TuUkyUQg',
                'message': {
                    'from_email': email,
                    'from_name': name,
                    'headers': {
                        'Reply-To': email
                    },
                    'subject': 'Website Contact Form Submission',
                    'text': msg,
                    'to': [
                    {
                        'email': 'name@place.com',
                        'name': 'Contact name',
                        'type': 'to'
                    }]
                }
            }
        })
        .done(function(response) {
            alert('Your message has been sent. Thank you!'); // show success message
            $("#name").val(''); // reset field after successful submission
            $("#email").val(''); // reset field after successful submission
            $("#msg").val(''); // reset field after successful submission
        })
        .fail(function(response) {
            alert('Error sending message.');
        });
        return false; // prevent page refresh
    });
});
```

### Steps to create the Form

At the end of all that, we should be left with:

```html
<!-- Needs to be within a container or row div -->
<div class="col-md-6">
  <form class="form-horizontal" id="contact_form">
    <!-- Form Name -->
    <h3>Contact Us</h3>
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="name">Name</label>
      <div class="col-md-5">
        <input id="name" name="name" type="text" placeholder="Enter your full name here"
        class="form-control input-md" required="">

      </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="email">Email</label>
      <div class="col-md-5">
        <input id="email" name="email" type="text" placeholder="Enter your email address here"
        class="form-control input-md" required="">

      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="msg">Message</label>
      <div class="col-md-4">
        <textarea class="form-control" id="msg" name="msg" cols="6" rows="6"></textarea>
      </div>
    </div>

    <!-- Button -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="submit"></label>
      <div class="col-md-4">
        <button id="submit" name="submit" class="btn btn-primary">Send Message</button>
      </div>
    </div>
  </form>
</div>
```