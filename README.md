# GOV.UK Design System

[![Gem Version](https://badge.fury.io/rb/govuk-design-system-rails.svg)](https://rubygems.org/gems/govuk-design-system-rails)

This gem contains a [Rails engine](https://guides.rubyonrails.org/engines.html) containing a Ruby on Rails port of some [GOV.UK Design System](https://design-system.service.gov.uk/) components.

It was originally extracted from Ruby applications built by the Office for Product Safety and Standards (see: https://github.com/UKGovernmentBEIS/beis-opss/pull/1374) and is by no means complete. Not every component is implemented and some components may not behave in exactly the same way as the originals. The project does aim for feature parity and PRs are welcome.

## Compatibility

You **must** include the [govuk-frontend](https://github.com/alphagov/govuk-frontend/) assets (CSS, JS, images, etc.) in your application in order to make use of this library. These assets are not bundled with this gem. This gem aims for parity with a specific version of the `govuk-frontend` library.

| This gem's version | Compatible with `govuk-frontend` version |
|--------------------| --- |
| 0.9.7              | 4.3.1 |
| 0.9.0              | 4.1.0 |
| 0.8.2              | 3.14.0 |

# Installation

Add the following to your project's Gemfile:

```ruby
gem "govuk-design-system-rails"
```
and run `bundle install`

# Design System Components

The [GOV.UK design system](https://design-system.service.gov.uk) provides a reference implementation of its components in Nunjucks, which are unfortunately not supported on Ruby. In lieu of that, we are implementing
ERB versions of the components that can be used throughout the applications.

## Component implementations

Component implementations can be found in the [components directory](app/views/components). They try to follow the
nunjucks implementations as close as possible. In particular, we are keeping the interface the same (param names etc.)
to make translating code between the macros usage and our implementation as close as possible.
This means that we can use the documentation provided by design system for macro options,
e.g. see [macro options for radios](https://design-system.service.gov.uk/components/radios/#options-example-default)

Notable differences from nunjucks:
- we are not allowing unescaped html in `html` attributes. Instead, the expected use-case is to build the required html
    and `capture` it, e.g.:
    ```erb
    <% html = capture do %>
      <h3>Custom html content</h3>
    <% end %>
    <%= govukLabel html: html, for: "someId" %>
    ```
    This renders most `text` and `html` attributes functionally identical, but we are choosing to keep both for consistency
    with nunjucks templates
- We extended the govukSelect component to streamline using it as accessible autocomplete component.
    Our version accepts extra options:
    - is_autocomplete, when true, makes the select an
    [accessible autocomplete](https://github.com/alphagov/accessible-autocomplete)
    - show_all_values, when true and is_autocomplete true, makes the autocomplete show all values,
    as well as adds an 'x' to remove currently selected value.
- hidden fields in checkboxes, to account for rails checkboxes "gotcha". The default value is 0 but can be set through the 'unchecked_value' attribute.
  https://apidock.com/rails/ActionView/Helpers/FormHelper/check_box

## Rails integration

To simplify working with rails form helpers, we are also providing a bit of "glue" which infers the values that it
can from the form object and converts them into appropriate params for the view components. Those can be found
in the [form_components directory](app/views/form_components).

The intent of keeping this "glue" separate from the component implementations is to make keeping the components up to
date with the corresponding macros as simple as possible.

The helpers accept a `form` parameter, when this is present, the `form_components` version of a component is used.
