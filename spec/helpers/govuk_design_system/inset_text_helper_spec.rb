require "rails_helper"

RSpec.describe GovukDesignSystem::InsetTextHelper, type: :helper do
  describe "#govukInsetText" do
    it "returns the correct HTML for the default example" do
      html = helper.govukInsetText({
        text: "It can take up to 8 weeks to register a lasting power of attorney if there are no mistakes in the application."
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-inset-text">
          It can take up to 8 weeks to register a lasting power of attorney if there are no mistakes in the application.
        </div>
      HTML
    end

    it "returns the correct HTML for an example using html" do
      inset_html = <<~HTML.html_safe
        <p class="govuk-body-l govuk-!-margin-bottom-4">
          Creating a case starts from a product record page.
        </p>
        <p class="govuk-body">
          Find a product and create the case from there.
        </p>
        <details class="govuk-details" data-module="govuk-details">
          <summary class="govuk-details__summary">
            <span class="govuk-details__summary-text">
              How to create a case
            </span>
          </summary>
        </details>
      HTML

      html = helper.govukInsetText({
        classes: "govuk-!-margin-bottom-7",
        html: inset_html
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-inset-text govuk-!-margin-bottom-7">
          <p class="govuk-body-l govuk-!-margin-bottom-4">
            Creating a case starts from a product record page.
          </p>
          <p class="govuk-body">
            Find a product and create the case from there.
          </p>
          <details class="govuk-details" data-module="govuk-details">
            <summary class="govuk-details__summary">
              <span class="govuk-details__summary-text">
                How to create a case
              </span>
            </summary>
          </details>
        </div>
      HTML
    end
  end
end
