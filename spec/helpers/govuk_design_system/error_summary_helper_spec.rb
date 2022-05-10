require "rails_helper"

RSpec.describe GovukDesignSystem::ErrorSummaryHelper, type: :helper do
  describe "#govukErrorSummary" do
    it "returns the correct HTML for the default example" do
      html = helper.govukErrorSummary({
        titleText: "There is a problem",
        errorList: [
          {
            text: "The date your passport was issued must be in the past",
            href: "#passport-issued-day"
          },
          {
            text: "Enter a postcode, like AA1 1AA",
            href: "#postcode-input"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-error-summary" aria-labelledby="error-summary-title" role="alert" data-module="govuk-error-summary">
          <h2 class="govuk-error-summary__title" id="error-summary-title">
            There is a problem
          </h2>
          <div class="govuk-error-summary__body">
            <ul class="govuk-list govuk-error-summary__list">
              <li>
                <a href="#passport-issued-day">The date your passport was issued must be in the past</a>
              </li>
              <li>
                <a href="#postcode-input">Enter a postcode, like AA1 1AA</a>
              </li>
            </ul>
          </div>
        </div>
      HTML
    end
  end
end
