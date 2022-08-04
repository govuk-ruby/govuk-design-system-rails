require "rails_helper"

RSpec.describe GovukDesignSystem::LabelHelper, type: :helper do
  describe "#govukLabel" do
    it "returns the correct HTML for the default example" do
      html = helper.govukLabel({
        html: "<strong>test</strong>".html_safe,
        isPageHeading: true,
        for: "test"
      })

      expect(html).to match_html(<<~HTML)
        <h1 class="govuk-label-wrapper">
          <label class="govuk-label" for="test">
            <strong>test</strong>
          </label>
        </h1>
      HTML
    end
  end
end
