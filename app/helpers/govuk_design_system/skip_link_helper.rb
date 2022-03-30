module GovukDesignSystem
  module SkipLinkHelper
    # Based on https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/skip-link/template.njk
    def govukSkipLink(text: nil, html: nil, href: "#content", classes: "", attributes: {})
      attributes["class"] = "govuk-skip-link #{classes}"
      attributes["href"] = href

      content_tag("a", attributes) do
        html || text
      end
    end
  end
end
