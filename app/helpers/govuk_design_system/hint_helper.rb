module GovukDesignSystem
  module HintHelper

    # The hint component is used within other input components.
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/hint/template.njk)
    def govukHint(id: nil, classes: "", attributes: nil, text: nil, html: nil)
      attributes ||= {}
      attributes[:class] = "govuk-hint #{classes}"
      attributes[:id] = id if id

      content_tag("span", attributes) do
        html || text
      end
    end

  end
end
