require "rails_helper"

RSpec.describe GovukDesignSystem::ErrorMessageHelper, type: :helper do
  describe "#govukErrorMessage" do
    it "returns the correct HTML for the default example" do
      html = helper.govukErrorMessage({
        text: "Rhowch eich enw llawn",
        visuallyHiddenText: "Gwall"
      })

      expect(html).to match_html(<<~HTML)
        <p class="govuk-error-message">
          <span class="govuk-visually-hidden">Gwall:</span> Rhowch eich enw llawn
        </p>
      HTML
    end
  end
end
