module GovukDesignSystem
  module LabelHelper

    # The label component is used within other input components.
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/label/template.njk)
    def govukLabel(for:, html: nil, text: nil, isPageHeading: false, classes: "", attributes: {})
      attributes[:class] = "govuk-label #{classes}"

      label_html = content_tag("label", attributes) do
        html || text
      end

      if isPageHeading
        content_tag("h1", label_html, class: "govuk-label-wrapper")
      else
        label_html
      end
    end

  end
end
