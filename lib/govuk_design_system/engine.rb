module GovukDesignSystem
  class Engine < ::Rails::Engine
    isolate_namespace GovukDesignSystem

    initializer "govuk_design_system.action_view" do |_app|
      ActiveSupport.on_load(:action_view) do
        # NOTE: These includes make the helpers available in every view of the
        #   consuming application. If a helper is not listed here, it will be
        #   isolated, and unavailable to apps which use this gem.
        ActionView::Base.include GovukDesignSystem::AccordionHelper
        ActionView::Base.include GovukDesignSystem::BackLinkHelper
        ActionView::Base.include GovukDesignSystem::BreadcrumbsHelper
        ActionView::Base.include GovukDesignSystem::ButtonHelper
        ActionView::Base.include GovukDesignSystem::CheckboxesHelper
        ActionView::Base.include GovukDesignSystem::ComponentsHelper
        ActionView::Base.include GovukDesignSystem::CookieBannerHelper
        ActionView::Base.include GovukDesignSystem::DateInputHelper
        ActionView::Base.include GovukDesignSystem::DetailsHelper
        ActionView::Base.include GovukDesignSystem::ErrorMessageHelper
        ActionView::Base.include GovukDesignSystem::ErrorSummaryHelper
        ActionView::Base.include GovukDesignSystem::FieldsetHelper
        ActionView::Base.include GovukDesignSystem::FieldsetHelper
        ActionView::Base.include GovukDesignSystem::FileUploadHelper
        ActionView::Base.include GovukDesignSystem::HeaderHelper
        ActionView::Base.include GovukDesignSystem::HintHelper
        ActionView::Base.include GovukDesignSystem::HmctsBadgeHelper
        ActionView::Base.include GovukDesignSystem::HmctsBannerHelper
        ActionView::Base.include GovukDesignSystem::InputHelper
        ActionView::Base.include GovukDesignSystem::InsetTextHelper
        ActionView::Base.include GovukDesignSystem::LabelHelper
        ActionView::Base.include GovukDesignSystem::NotificationBannerHelper
        ActionView::Base.include GovukDesignSystem::PhaseBannerHelper
        ActionView::Base.include GovukDesignSystem::RadiosHelper
        ActionView::Base.include GovukDesignSystem::SelectHelper
        ActionView::Base.include GovukDesignSystem::SkipLinkHelper
        ActionView::Base.include GovukDesignSystem::SummaryListHelper
        ActionView::Base.include GovukDesignSystem::TabsHelper
        ActionView::Base.include GovukDesignSystem::TagHelper
        ActionView::Base.include GovukDesignSystem::TextareaHelper
        ActionView::Base.include GovukDesignSystem::WarningTextHelper
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
