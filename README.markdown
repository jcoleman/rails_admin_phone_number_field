RailsAdmin Phone Number Field
=============================

Why?
----

I needed phone number fields in our RailsAdmin installation to be auto-formatted, and the auto-formatting needed to handle all international numbers (not just US.)

What?
-----

This gem adds a new field type to RailsAdmin, `:phone_number_field`.

How?
----

In a particular RailsAdmin model config, you might have something like the following:

    config.model "User" do
      edit do
        include_all_fields
        field :cell_number, :phone_number_field
      end
    end

In order to get the formatting functionality, you also need to add the included `js/PhoneFormat.js` and `js/phone-number-input.js.coffee` files to your rails app's `javascripts` directory, and add the following to the `my_app/rails_app/custom/ui.js.coffee` (or, convert it to plain JS if you'd like) file:

    //= require PhoneFormat
    //= require phone-number-input

    $(document).bind 'rails_admin.dom_ready', ->
      $('.rails-admin-phone-number-field').each ->
        $(this).phoneNumberInput()

That's it!

License
-------

This library is licensed on the MIT license. All copyrights are reserved to me, James Coleman (with the exception of the `PhoneFormat.js` file, which is a separate library available under the Apache 2.0 license.)

Copyright 2013 James Coleman

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.