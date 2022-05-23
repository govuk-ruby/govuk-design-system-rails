require "rails_helper"

RSpec.describe GovukDesignSystem::RadiosHelper, type: :helper do
  describe "#govukRadios" do
    it "returns the correct HTML for the default example" do
      html = helper.govukRadios({
        classes: "govuk-radios--inline",
        idPrefix: "changed-name",
        name: "changed-name",
        fieldset: {
          legend: {
            text: "Have you changed your name?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "This includes changing your last name or spelling your name differently."
        },
        items: [
          {
            value: "yes",
            text: "Yes"
          },
          {
            value: "no",
            text: "No"
          }
        ]
      })

      expect(html).to match_html(<<~HTML)
      <div class="govuk-form-group">
        <fieldset class="govuk-fieldset" aria-describedby="changed-name-hint">
          <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
            <h1 class="govuk-fieldset__heading">
              Have you changed your name?
            </h1>
          </legend>
          <div id="changed-name-hint" class="govuk-hint">
            This includes changing your last name or spelling your name differently.
          </div>
          <div class="govuk-radios govuk-radios--inline" data-module="govuk-radios">
            <div class="govuk-radios__item">
              <input class="govuk-radios__input" id="changed-name" name="changed-name" type="radio" value="yes">
              <label class="govuk-label govuk-radios__label" for="changed-name">
                Yes
              </label>
            </div>
            <div class="govuk-radios__item">
              <input class="govuk-radios__input" id="changed-name-2" name="changed-name" type="radio" value="no">
              <label class="govuk-label govuk-radios__label" for="changed-name-2">
                No
              </label>
            </div>
          </div>

          </fieldset>
        </div>
      HTML
    end
  end
end
