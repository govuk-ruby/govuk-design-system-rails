module GovukDesignSystem
  module ErrorSummaryHelper

    # Use the [error summary component](https://design-system.service.gov.uk/components/error-summary/)
    # at the top of a page to summarise any errors a user has made
    #
    # Code based upon [nunjucks template](https://github.com/alphagov/govuk-frontend/blob/master/src/govuk/components/error-summary/template.njk)
    def govukErrorSummary(titleText: nil, titleHtml: nil, descriptionText: nil, descriptionHtml: nil, errorList: [], classes: "", attributes: {})

      attributes[:class] = "govuk-error-summary #{classes}"
      attributes["aria-labelledby"] = "error-summary-title"
      attributes[:role] = "alert"
      attributes[:tabindex] = "-1"
      attributes["data-module"] = "govuk-error-summary"

      content_tag "div", attributes do

        concat content_tag("h2", class: "govuk-error-summary__title", id: "error-summary-title") do
          titleHtml || titleText
        end

        concat content_tag("div", class: "govuk-error-summary__body") do

          if descriptionHtml || descriptionText
            concat content_tag("p", descriptionHtml || descriptionText)
          end

          concat content_tag("ul", class: "govuk-list govuk-error-summary__list") do
            errorList.each do |item|

              concat content_tag("li") do

                if item[:href]
                  concat link_to(item[:html] || item[:text], item[:href], item[:attributes])
                else
                  concat (item[:html] || item[:text])
                end
              end
            end
          end

        end
      end
    end
  end
end
