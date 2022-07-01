require "rails_helper"

RSpec.describe GovukDesignSystem::HmctsBadgeHelper, type: :helper do
  describe "#hmctsBadge" do
    it "returns the correct HTML for success" do
      html = helper.hmctsBadge({
        text: "Information",
        classes: "hmcts-govuk-badge--green"
      })

      expect(html).to match_html(<<~HTML)
        <span class="hmcts-badge hmcts-govuk-badge--green">Information</span>
      HTML
    end
  end
end
