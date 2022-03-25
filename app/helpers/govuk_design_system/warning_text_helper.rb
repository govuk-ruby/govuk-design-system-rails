module GovukDesignSystem
  module WarningTextHelper
    # Use the [warning text component](https://design-system.service.gov.uk/components/warning-text/)
    # when you need to warn users about something important, such as legal consequences of an action,
    # or lack of action, that they might take.
    #
    # Implementation based on https://github.com/alphagov/govuk-frontend/tree/master/src/govuk/components/warning-text
    def govukWarningText(iconFallbackText:, text: nil, html: nil, classes: "", attributes: {})
      attributes[:class] = "govuk-warning-text #{classes}"

      content_tag("div", attributes) do
        content_tag("span", "!", class: "govuk-warning-text__icon", "aria-hidden" => "true") +
          content_tag("strong", class: "govuk-warning-text__text") do
            content_tag("span", iconFallbackText, class: "govuk-warning-text__assistive") +
              (html || text)
          end
      end
    end
  end
end
