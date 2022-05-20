require "rails_helper"

RSpec.describe GovukDesignSystem::HintHelper, type: :helper do
  describe "#govukHint" do
    it "returns the correct HTML for the default example" do
      html = helper.govukHint({
        id: "test-hint",
        classes: %w[test-class],
        attributes: { "data-test" => "test-attr" },
        text: "test"
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-hint test-class" data-test="test-attr" id="test-hint">
          test
        </div>
      HTML
    end
  end
end
