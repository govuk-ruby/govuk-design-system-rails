module GovukDesignSystem
  module ErrorMessageHelper

    # Use the [error message component](https://design-system.service.gov.uk/components/error-message/)
    # when there is a validation error. Explain what went wrong and how to fix it.
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/error-message/template.njk)
    def govukErrorMessage(id: nil, html: nil, text: nil, classes: "", visuallyHiddenText: nil, attributes: {})
      visuallyHiddenText ||= "Error"

      attributes ||= {}
      attributes[:id] = id if id
      attributes[:class] = "govuk-error-message #{classes}"

      content_tag("span", attributes) do
        if visuallyHiddenText
          concat content_tag("span", "#{visuallyHiddenText}:", class: "govuk-visually-hidden")
          concat " "
        end
        concat (html || text)
      end
    end

  end
end
