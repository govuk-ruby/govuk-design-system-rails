module GovukDesignSystem
  module TagHelper
    # Generates the HTML for the
    # [Tag component](https://design-system.service.gov.uk/components/tag/)
    # from the GOV.UK Design System.
    #
    # Use the tag component to indicate the status of something, such as an item
    # on a task list or a phase banner.
    #
    # Implementation based on https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/tag/template.njk
    def govukTag(text: nil, html: nil, classes: "", attributes: {})
      attributes["class"] = "govuk-tag #{classes}"
      content_tag("strong", (html || text), attributes)
    end
  end
end
