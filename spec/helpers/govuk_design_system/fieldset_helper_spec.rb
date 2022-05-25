require "rails_helper"

RSpec.describe GovukDesignSystem::FieldsetHelper, type: :helper do
  describe "#govukTag" do
    it "returns the correct HTML for the default example" do
      html = helper.govukFieldset({
        text: "completed"
      })

      expect(html).to match_html(<<~HTML)
        <strong class="govuk-tag">
          completed
        </strong>
      HTML
    end
  end
end
