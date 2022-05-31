require "rails_helper"

RSpec.describe GovukDesignSystem::DateInputHelper, type: :helper do
  describe "#govukDateInput" do
    it "returns the correct HTML for the default example" do
      html = helper.govukDateInput({
        id: "passport-issued",
        namePrefix: "passport-issued",
        fieldset: {
          legend: {
            text: "When was your passport issued?",
            isPageHeading: true,
            classes: "govuk-fieldset__legend--l"
          }
        },
        hint: {
          text: "For example, 27 3 2007"
        }
      })

      expect(html).to match_html(<<~HTML)
        <div class="govuk-form-group">
          <fieldset class="govuk-fieldset" role="group" aria-describedby="passport-issued-hint">
            <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
              <h1 class="govuk-fieldset__heading">
                When was your passport issued?
              </h1>
            </legend>
            <div id="passport-issued-hint" class="govuk-hint">
              For example, 27 3 2007
            </div>
            <div class="govuk-date-input" id="passport-issued">
              <div class="govuk-date-input__item">
                <div class="govuk-form-group">
                  <label class="govuk-label govuk-date-input__label" for="passport-issued-day">
                    Day
                  </label>
                  <input class="govuk-input govuk-date-input__input govuk-input--width-2" id="passport-issued-day" name="passport-issued-day" type="text" inputmode="numeric">
                </div>
              </div>
              <div class="govuk-date-input__item">
                <div class="govuk-form-group">
                  <label class="govuk-label govuk-date-input__label" for="passport-issued-month">
                    Month
                  </label>
                  <input class="govuk-input govuk-date-input__input govuk-input--width-2" id="passport-issued-month" name="passport-issued-month" type="text" inputmode="numeric">
                </div>
              </div>
              <div class="govuk-date-input__item">
                <div class="govuk-form-group">
                  <label class="govuk-label govuk-date-input__label" for="passport-issued-year">
                    Year
                  </label>
                  <input class="govuk-input govuk-date-input__input govuk-input--width-4" id="passport-issued-year" name="passport-issued-year" type="text" inputmode="numeric">
                </div>
              </div>
            </div>
          </fieldset>
        </div>
      HTML
    end
  end
end
