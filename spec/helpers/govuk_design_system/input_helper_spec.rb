require "rails_helper"

RSpec.describe GovukDesignSystem::InputHelper, type: :helper do
  describe "#govukInput" do
    it "returns the correct HTML for the default example" do
      html = helper.govukInput({
        label: {
          text: "What is the name of the event?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        id: "event-name",
        name: "event-name"
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="event-name">
              What is the name of the event?
            </label>
          </h1>
          <input class="govuk-input" id="event-name" name="event-name" type="text">
        </div>
      HTML
    end

    it "allows a prefix" do
      html = helper.govukInput({
        id: "cost",
        name: "cost",
        label: {
          text: "What is the cost in pounds?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        prefix: {
          text: "£"
        },
        classes: "govuk-input--width-5",
        spellcheck: false
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="cost">
              What is the cost in pounds?
            </label>
          </h1>
          <div class="govuk-input__wrapper">
            <div class="govuk-input__prefix" aria-hidden="true">£</div>
            <input class="govuk-input govuk-input--width-5" id="cost" name="cost" type="text" spellcheck="false">
          </div>
        </div>
      HTML
    end

    it "allows hint text" do
      html = helper.govukInput({
        label: {
          text: "What is the name of the event?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        hint: {
          text: "The name you’ll use on promotional material"
        },
        id: "event-name",
        name: "event-name"
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="event-name">
              What is the name of the event?
            </label>
          </h1>
          <div id="event-name-hint" class="govuk-hint">
            The name you’ll use on promotional material
          </div>
          <input class="govuk-input" id="event-name" name="event-name" type="text" aria-describedby="event-name-hint">
        </div>
      HTML
    end

    it "allows a pattern to be specified" do
      html = helper.govukInput({
        label: {
          text: "What is your account number?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        classes: "govuk-input--width-10",
        hint: {
          text: "Must be between 6 and 8 digits long"
        },
        id: "account-number",
        name: "account-number",
        inputmode: "numeric",
        pattern: "[0-9]*",
        spellcheck: false
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="account-number">
              What is your account number?
            </label>
          </h1>
          <div id="account-number-hint" class="govuk-hint">
            Must be between 6 and 8 digits long
          </div>
          <input class="govuk-input govuk-input--width-10" id="account-number" name="account-number" type="text" spellcheck="false" aria-describedby="account-number-hint" pattern="[0-9]*" inputmode="numeric">
        </div>
      HTML
    end

    it "handles error messages correctly" do
      html = helper.govukInput({
        id: "cost-per-item-error",
        name: "cost-per-item-error",
        label: {
          text: "What is the cost per item, in pounds?",
          classes: "govuk-label--l",
          isPageHeading: true
        },
        prefix: {
          text: "£"
        },
        suffix: {
          text: "per item"
        },
        errorMessage: {
          text: "Enter a cost per item, in pounds"
        },
        classes: "govuk-input--width-5",
        spellcheck: false
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group govuk-form-group--error">
          <h1 class="govuk-label-wrapper"><label class="govuk-label govuk-label--l" for="cost-per-item-error">
              What is the cost per item, in pounds?
            </label>
          </h1>
          <p id="cost-per-item-error-error" class="govuk-error-message">
            <span class="govuk-visually-hidden">Error:</span> Enter a cost per item, in pounds
          </p>
          <div class="govuk-input__wrapper">
            <div class="govuk-input__prefix" aria-hidden="true">£</div>
            <input class="govuk-input govuk-input--width-5 govuk-input--error" id="cost-per-item-error" name="cost-per-item-error" type="text" spellcheck="false" aria-describedby="cost-per-item-error-error">
            <div class="govuk-input__suffix" aria-hidden="true">per item</div>
          </div>
        </div>
      HTML
    end
  end
end
