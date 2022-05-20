require "rails_helper"

RSpec.describe GovukDesignSystem::ButtonHelper, type: :helper do
  describe "#govukButton" do
    it "returns the correct HTML for the default example" do
      html = helper.govukButton({
        text: "Save and continue"
      })

      expect(html).to match_html(<<~HTML)
        <button class="govuk-button" data-module="govuk-button">
          Save and continue
        </button>
      HTML
    end

    it "produces start buttons with an href as link" do
      html = helper.govukButton({
        text: "Start now",
        href: "#",
        isStartButton: true
      })

      expect(html).to match_html(<<~HTML)
        <a href="#" role="button" draggable="false" class="govuk-button govuk-button--start" data-module="govuk-button">
          Start now
          <svg class="govuk-button__start-icon" xmlns="http://www.w3.org/2000/svg" width="17.5" height="19" viewBox="0 0 33 40" aria-hidden="true" focusable="false">
            <path fill="currentColor" d="M0 0h13l20 20-20 20H0l20-20z" />
          </svg>
        </a>
      HTML
    end
  end
end
