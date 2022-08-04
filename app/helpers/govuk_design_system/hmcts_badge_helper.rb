module GovukDesignSystem
  module HmctsBadgeHelper
    def hmctsBadge(text: "", classes: nil)
      tag.span(text, class: class_names("hmcts-badge", classes))
    end
  end
end
