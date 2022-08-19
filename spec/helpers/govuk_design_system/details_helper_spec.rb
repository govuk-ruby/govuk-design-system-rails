require "rails_helper"

RSpec.describe GovukDesignSystem::DetailsHelper, type: :helper do
  describe "#govukDetails" do
    it "returns the correct HTML for the default example" do
      html = helper.govukDetails({
        summaryText: "Help with nationality",
        text: "We need to know your nationality so we can work out which elections you’re entitled to vote in. If you cannot provide your nationality, you’ll have to send copies of identity documents through the post."
      })

      expect(html).to match_html(<<~HTML)
        <details class="govuk-details" data-module="govuk-details">
          <summary class="govuk-details__summary">
            <span class="govuk-details__summary-text">
              Help with nationality
            </span>
          </summary>
          <div class="govuk-details__text">
            We need to know your nationality so we can work out which elections you’re entitled to vote in. If you cannot provide your nationality, you’ll have to send copies of identity documents through the post.
          </div>
        </details>
      HTML
    end

    it "accepts a block to generate the HTML" do
      html = helper.govukDetails({ summaryText: "Testing block generation" }) { "Inner HTML" }

      expect(html).to match_html(<<~HTML)
        <details class="govuk-details" data-module="govuk-details">
          <summary class="govuk-details__summary">
            <span class="govuk-details__summary-text">
              Testing block generation
            </span>
          </summary>
          <div class="govuk-details__text">
            Inner HTML
          </div>
        </details>
      HTML
    end
  end
end
