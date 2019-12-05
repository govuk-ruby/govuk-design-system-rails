module GovukDesignSystem
  module BackLinkHelper

    # Use the [back link component](https://design-system.service.gov.uk/components/back-link/)
    # to help users go back to the previous page in a multi-page transaction.
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/back-link/template.njk)
    def govukBackLink(text: nil, html: nil, href:, classes: "", attributes: {})
      attributes[:class] = "govuk-back-link #{classes}"

      link_to (html || text), href, attributes
    end
  end
end
