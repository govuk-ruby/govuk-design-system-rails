require "rails_helper"

RSpec.describe GovukDesignSystem::TextAreaHelper, type: :helper do
  describe "#govukTextarea" do
    it "when hint is included returns the correct HTML" do
      html = helper.govukTextarea({
        name: "more-detail",
        id: "more-detail",
        label: {
          text: "Can you provide more detail?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        hint: {
          text: "Do not include personal or financial information, like your National Insurance number or credit card details."
        }
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="more-detail">
            Can you provide more detail?
            </label>
          </h1>
          <div id="more-detail-hint" class="govuk-hint">
            Do not include personal or financial information, like your National Insurance number or credit card details.
          </div>
          <textarea class="govuk-textarea" id="more-detail" name="more-detail" rows="5" aria-describedby="more-detail-hint"></textarea>
        </div>
      HTML
    end

    it "when there is an error message is returns the correct HTML" do
      html = helper.govukTextarea({
        name: "more-detail",
        id: "more-detail",
        label: {
          text: "Can you provide more detail?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        hint: {
          text: "Do not include personal or financial information, like your National Insurance number or credit card details."
        },
        errorMessage: {
          text: "Enter more detail"
        }
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group govuk-form-group--error">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="more-detail">
              Can you provide more detail?
            </label>
          </h1>
          <div id="more-detail-hint" class="govuk-hint">
            Do not include personal or financial information, like your National Insurance number or credit card details.
          </div>
          <p id="more-detail-error" class="govuk-error-message">
            <span class="govuk-visually-hidden">Error:</span> Enter more detail
          </p>
          <textarea class="govuk-textarea govuk-textarea--error" id="more-detail" name="more-detail" rows="5" aria-describedby="more-detail-hint more-detail-error"></textarea>
        </div>
      HTML
    end
  end
end
