require "rails_helper"

RSpec.describe GovukDesignSystem::HmctsBannerHelper, type: :helper do
  describe "#govukInput" do
    it "returns the correct HTML for success" do
      html = helper.hmctsBanner({
        text: "The image was added",
        type: "success"
      })

      expect(html).to match_html(<<~HTML)
        <div class="hmcts-banner hmcts-banner--success">
          <div class="hmcts-banner__message">
            The image was added
            <svg class="hmcts-banner__icon" focusable="false" height="25" role="presentation" viewBox="0 0 25 25" width="25" xmlns="http://www.w3.org/2000/svg">
              <path d="M25,6.2L8.7,23.2L0,14.1l4-4.2l4.7,4.9L21,2L25,6.2z"></path>
            </svg>
          </div>
        </div>
      HTML
    end

    it "returns the correct HTML for information" do
      html = helper.hmctsBanner({
        text: "The image did not finish uploading - you must refresh the image",
        type: "information"
      })

      expect(html).to match_html(<<~HTML)
        <div class="hmcts-banner">
          <div class="hmcts-banner__message">
            The image did not finish uploading - you must refresh the image
            <svg class="hmcts-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
              <path d="M13.7,18.5h-2.4v-2.4h2.4V18.5z M12.5,13.7c-0.7,0-1.2-0.5-1.2-1.2V7.7c0-0.7,0.5-1.2,1.2-1.2s1.2,0.5,1.2,1.2v4.8 C13.7,13.2,13.2,13.7,12.5,13.7z M12.5,0.5c-6.6,0-12,5.4-12,12s5.4,12,12,12s12-5.4,12-12S19.1,0.5,12.5,0.5z"></path>
            </svg>
          </div>
        </div>
      HTML
    end

    it "returns the correct HTML when a symbol type is passed" do
      html = helper.hmctsBanner({
        text: "The image did not finish uploading - you must refresh the image",
        type: :information
      })

      expect(html).to match_html(<<~HTML)
        <div class="hmcts-banner">
          <div class="hmcts-banner__message">
            The image did not finish uploading - you must refresh the image
            <svg class="hmcts-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
              <path d="M13.7,18.5h-2.4v-2.4h2.4V18.5z M12.5,13.7c-0.7,0-1.2-0.5-1.2-1.2V7.7c0-0.7,0.5-1.2,1.2-1.2s1.2,0.5,1.2,1.2v4.8 C13.7,13.2,13.2,13.7,12.5,13.7z M12.5,0.5c-6.6,0-12,5.4-12,12s5.4,12,12,12s12-5.4,12-12S19.1,0.5,12.5,0.5z"></path>
            </svg>
          </div>
        </div>
      HTML
    end
  end
end
