module GovukDesignSystem
  module PhaseBannerHelper
    # Generates the HTML for the
    # [Phase banner component](https://design-system.service.gov.uk/components/phase-banner/)
    # from the GOV.UK Design System.
    #
    # Use the phase banner component to show users your service is still being worked on.
    #
    # Implementation based on https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/details/
    def govukPhaseBanner(text: nil, html: nil, tag: nil, classes: '', attributes: {})
      attributes["class"] = "govuk-phase-banner #{classes}"

      content_tag("div", attributes) do
        content_tag("p", {class: "govuk-phase-banner__content"}) do
          concat govukTag(text: tag[:text], html: tag[:html], classes: "govuk-phase-banner__content__tag #{tag[:classes]}")
          concat content_tag("span", (html || text), {class: "govuk-phase-banner__text"})
        end
      end
    end
  end
end
